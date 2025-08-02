# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=0.13.14
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
sha256sums=('0d1f4b339ee68e260ebf11db5e2fa46513a8d1aeba2fcbcd83cfce1ae8bc0de6')
b2sums=('37f56828544e0ee43619f405cfe437729d741d3c553249edea03ce490d1df671bac54347558460ec164c9074ac3b6420d89fafe55a322935deab5f2964a31677')

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
