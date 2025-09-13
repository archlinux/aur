# Maintainer: kris57 <kris319 at protonmail dot com>
# Contributor: Zhang Hua <zhanghuadedn at gmail dot com>
# Contributor: Coelacanthus <coelacanthus@outlook.com.com>
# Contributor: yjun <jerrysteve1101@gmail.com>

pkgname='hentaiathome'
pkgver=1.6.4
pkgrel=4
pkgdesc="An open-source Peer-2-Peer gallery distribution system which reduces the load on the E-Hentai Galleries"
arch=('any')
url="https://ehwiki.org/wiki/Hentai@Home"
license=('GPL3')
provides=('hath' 'hentaiathome' 'hentaiathome-cli' 'hentaiathome-gui')
conflicts=('hath' 'hentaiathome-bin' 'hentaiathome-cli' 'hentaiathome-gui')
makedepends=('java-environment>=8')
depends=('java-runtime>=8' 'bash')
optdepends=('hicolor-icon-theme: desktop icon')
source=("HentaiAtHome_${pkgver}.zip::https://repo.e-hentai.org/hath/HentaiAtHome_${pkgver}_src.zip"
        "hentaiathome@.service"
        "hentaiathome.desktop"
        "hentaiathome-cli"
        "hentaiathome-gui"
        "hentaiathome.sysusers"
        "hentaiathome.tmpfiles"
        "hathd"
        "hath.service")
sha256sums=('4d3f7d67b05089dab0c6d774999605cd121997f36d0ef5f75a380d90f73df29d'
            '5bde26294110d8454c40772ed147238741ab7d992e7c5f8054e2cd139222258f'
            'c50d1fb930990b033445351d7186634ed55bd083dbbb634680507300211145a6'
            '51cada4de54ae73b575913498d4bb92e2c40116432d28b7e02665dfb970d4ddf'
            '89f9ef26b7a1abe9dce517fc108ffbc328c1ab8178e84274d112354cf777b91d'
            '32c7bbf67a3b830d4edc24d963fdcf98a4be2ae5c9a38c387c96fe0cde792bac'
            'd1f3aa5a0f79ee047e43f961ab32be6ba7ce69fc41902298b8831c0072e94f10'
            'd3d2e1877947fcf0bd19c74a75529b2985cb92cf6f99dd65dff3d659b681e4a0'
            '3e9a5c7b146bf783a257aad483f059966c6a13b5f715f1c3dff117f6cceeb200')

build(){
    cd "${srcdir}"
    make
    make all
}
package(){
    cd "${srcdir}"
    install -Dm644 build/HentaiAtHome.jar "${pkgdir}/usr/lib/hath/HentaiAtHome.jar"
    install -Dm644 build/HentaiAtHomeGUI.jar "${pkgdir}/usr/lib/hath/HentaiAtHomeGUI.jar"
    install -Dm644 src/hath/gui/icon16.png "${pkgdir}/usr/share/icons/hicolor/16x16/apps/hentaiathome.png"
    install -Dm644 src/hath/gui/icon32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/hentaiathome.png"
    install -Dm644 hentaiathome.sysusers "${pkgdir}/usr/lib/sysusers.d/hentaiathome.conf"
    install -Dm644 hentaiathome.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/hentaiathome.conf"
    install -Dm644 hentaiathome.desktop "${pkgdir}/usr/share/applications/hentaiathome.desktop"
    install -Dm644 hath.service "${pkgdir}/usr/lib/systemd/system/hath.service"
    install -Dm644 hentaiathome@.service "${pkgdir}/usr/lib/systemd/system/hentaiathome@.service"
    install -Dm755 hathd "${pkgdir}/usr/bin/hathd"
    install -Dm755 hentaiathome-cli "${pkgdir}/usr/bin/hentaiathome-cli"
    install -Dm755 hentaiathome-gui "${pkgdir}/usr/bin/hentaiathome-gui"
}

