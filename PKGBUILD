# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.13.19
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
sha256sums=('613fc20630ac42fa3c0f6aaea136039e0daec11e587105772b907f0dba28e19f')
b2sums=('b7c7e67e6337cbe34d33636c7fcf189ab9505e27a01e7417d753cc2fced7c09ce3622f70a1a306d92775b0a6a5cb721eac7380560e0064ccfecd51c36b757ab1')

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
