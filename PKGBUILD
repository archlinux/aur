# Maintainer: snemc1 <snemc@qq.com>
pkgname=markpix-bin
_pkgname=markpix
pkgver=0.5.0
pkgrel=1
pkgdesc="A modern cross-platform image annotation tool built with Tauri (Binary)"
arch=('x86_64')
url="https://github.com/jswysnemc/markpix"
license=('MIT')
options=('!strip' '!debug')
provides=("$_pkgname")
conflicts=("$_pkgname")

depends=(
    'webkit2gtk-4.1'
    'libappindicator-gtk3'
    'librsvg'
    'wl-clipboard'
    'gtk3'
    'openssl'
)

source=("${_pkgname}-${pkgver}.deb::https://github.com/jswysnemc/markpix/releases/download/v${pkgver}/MarkPix_${pkgver}_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/jswysnemc/markpix/main/LICENSE")

sha256sums=('c827a2f7c9bc6d254589c4eb4d55e6eab52688e2407297e3e0dd7412523429b9'
            '9a46a71b6c82da530bc5f2d5e568bc4ae5d1d0f3e95510a85ab2cfbf048c6c24')

prepare() {
    cd "$srcdir"
    # 解压 deb 包
    ar x "${_pkgname}-${pkgver}.deb"
    # 解压 data.tar
    tar -xf data.tar.* -C "$srcdir"
}

package() {
    # 从解压的 deb 包中复制文件
    cp -r "${srcdir}/usr" "${pkgdir}/"

    # 安装 License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
