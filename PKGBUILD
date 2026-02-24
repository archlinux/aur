# Maintainer: snemc1 <snemc@qq.com>
pkgname=markpix-bin
_pkgname=markpix
pkgver=0.5.5
_debver=0.5.4
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

source=("${_pkgname}-${pkgver}.deb::https://github.com/jswysnemc/markpix/releases/download/v${pkgver}/MarkPix_${_debver}_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/jswysnemc/markpix/main/LICENSE")

sha256sums=('c788884117ae4bd38d8c4ba2f76728d4dcbe4826e8770524bd3ae62d17bb6cab'
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
