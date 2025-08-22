# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=1.0.0
pkgrel=4
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('rustup' 'gobject-introspection' 'glibc' 'protobuf')
depends=('gtk4-layer-shell' 'poppler-glib' 'cairo')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/refs/tags/v${pkgver}-beta-2.tar.gz")
sha256sums=("4227c3d277d1f930f531c6642dcb7d9964c43441f877c4bd6d0fa47f39654518")

build() {
    cd ${pkgname}-${pkgver}-beta-2
    rustup default stable
    cargo build --release
}

package() {
    cd ${pkgname}-${pkgver}-beta-2/target/release
    install -Dm 755 walker -t "${pkgdir}/usr/bin"

    cd ../../
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

    cd resources
    install -Dm 644 config.toml -t "${pkgdir}/etc/xdg/walker"

    cd themes/default
    install -Dm 644 item.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 item_calc.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 item_clipboard.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 item_dmenu.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 item_files.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 item_providerlist.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 item_symbols.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 layout.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 preview.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 style.css -t "${pkgdir}/etc/xdg/walker/themes/default"
}
