# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.13.16
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('go' 'gobject-introspection')
depends=('gtk4-layer-shell' 'libvips' 'ffmpeg')
optdepends=('wl-clipboard: for clipboard module' 'libqalculate: for calculator module')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a9a671998eb33d9d49a5cb6c11ccf8185843065b9c01e45383ae692ae53412c8')
b2sums=('b01f8e27de0a346d6607117b441160862accf89c19917b8b6e77b16838b743e0cf15bd1005b61f6f9f09495df420ebe8b5ca6f0da1bd6703b4517e09dca44fbc')

build() {
    cd ${pkgname}-${pkgver}/cmd

    go build -x -o walker
}

package() {
    cd ${pkgname}-${pkgver}/cmd
    install -Dm 755 walker -t "${pkgdir}/usr/bin"

    cd ../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    cd internal/config
    install -Dm 644 config.default.toml -t "${pkgdir}/etc/xdg/walker"
    mv "${pkgdir}/etc/xdg/walker/config.default.toml" "${pkgdir}/etc/xdg/walker/config.toml"

    cd themes
    install -Dm 644 default.toml -t "${pkgdir}/etc/xdg/walker/themes"

    install -Dm 644 xdg_default.css -t "${pkgdir}/etc/xdg/walker/themes"
    mv "${pkgdir}/etc/xdg/walker/themes/xdg_default.css" "${pkgdir}/etc/xdg/walker/themes/default.css"
}
