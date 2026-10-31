# Maintainer: KafCoppelia <k740677208@gmail.com>
pkgname=easycli-git
pkgver=0.3.60
pkgrel=1
pkgdesc="A desktop GUI from CLIProxyAPI"
arch=('x86_64')
license=('MIT')
url="https://github.com/router-for-me/EasyCLIProxyAPI"
depends=('bash' 'coreutils' 'glibc' 'libgcc' 'gtk3' 'glib2' 'gdk-pixbuf2' 'cairo' 'dbus' 'webkit2gtk-4.1' 'libsoup3' 'libayatana-appindicator' 'hicolor-icon-theme')
conflicts=('easycli')
provides=('easycli')
options=('!debug')
_commit=64677d4b0fd275cf3c397c0d4b965a91dfc99cf7
source=("${url}/releases/download/v${pkgver}/EasyCLIProxyAPI-v${pkgver}-Linux-amd64.tar.gz"
        "EasyCLIProxyAPI-${pkgver}-LICENSE::https://raw.githubusercontent.com/router-for-me/EasyCLIProxyAPI/${_commit}/LICENSE"
        "EasyCLIProxyAPI-${pkgver}-icon.png::https://raw.githubusercontent.com/router-for-me/EasyCLIProxyAPI/${_commit}/src-tauri/icons/128x128.png"
        'easycli.sh'
        'EasyCLI.desktop')
sha256sums=('bf8ef5d30dee195235c82aa14ab8ba0866b2e64eea7d80c436fca09f14d8e049'
            '6bd5d3c4fb6a34c0b83e91acd53a52fb8fd1ae9e19ba55b23788ec1dc52dbac7'
            '978f2987b1098a662a0fb969a1710ae3577093f381833e85a96c853172565e9b'
            'eeae736e07d9e680f2f1bc5eebcc03dfd638d8a7836f17ab6e772cbc649c9571'
            'c2d5c87cfb41d88bf13496b547c27a5ac0038acaab66d7be0e899ea2c8894bda')

prepare() {
    mkdir -p core-license
    bsdtar -xf "EasyCLIProxyAPI-v${pkgver}-Linux-amd64/cpa-core/"*.tar.gz -C core-license LICENSE
}

package() {
    cd "${srcdir}/EasyCLIProxyAPI-v${pkgver}-Linux-amd64"
    install -Dm755 EasyCLIProxyAPI "${pkgdir}/usr/lib/easycli/EasyCLIProxyAPI"
    install -Dm644 core-version.txt "${pkgdir}/usr/lib/easycli/core-version.txt"
    install -Dm644 cpa-core/*.tar.gz -t "${pkgdir}/usr/lib/easycli/cpa-core/"
    install -Dm755 "${srcdir}/easycli.sh" "${pkgdir}/usr/bin/easycli"
    install -Dm644 "${srcdir}/EasyCLI.desktop" "${pkgdir}/usr/share/applications/EasyCLI.desktop"
    install -Dm644 "${srcdir}/EasyCLIProxyAPI-${pkgver}-icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/easycli.png"
    install -Dm644 "${srcdir}/EasyCLIProxyAPI-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/core-license/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/CLIProxyAPI-LICENSE"
}
