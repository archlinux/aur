# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=1.0.0
pkgrel=19
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=('cargo' 'gobject-introspection' 'glibc' 'protobuf')
depends=('gtk4-layer-shell' 'poppler-glib' 'cairo')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/refs/tags/v${pkgver}-beta-17.tar.gz")
sha256sums=("dff9018adcbc3e84eaeae1d8c10b20913f1292c7d7f00847669600d00deba07e")

build() {
    cd ${pkgname}-${pkgver}-beta-17
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd ${pkgname}-${pkgver}-beta-17/target/release
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
