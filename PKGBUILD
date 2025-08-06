# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.13.18
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
sha256sums=('44b3ba1c4106dbb6a124e28cf2bf93a48fb9cdf6bb465623ce74fd3cdcf42db4')
b2sums=('d0dcf5882e4a1c5af8abe39220b8547d53f318893aea4b93bbd5a309b6395799c7e7c277056942d703090e6910bf632848481be7b27b2a7fcc83e02c423d85d2')

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
