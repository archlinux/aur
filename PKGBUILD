# Maintainer: Andrej Benz <hello[at]benz[dot]dev>

pkgname=walker
pkgver=1.0.1
pkgrel=1
pkgdesc='wayland application runner'
url='https://github.com/abenz1267/walker'
arch=('x86_64' 'aarch64')
license=('GPL')
makedepends=('cargo' 'gobject-introspection' 'glibc' 'protobuf')
depends=('gtk4-layer-shell' 'poppler-glib' 'cairo')
conflicts=('walker')
provides=('walker')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("604c874b0a2c26f39761231385b7881f714dce38abb36ef823f2acc7b346e169")

build() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd ${pkgname}-${pkgver}/target/release
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
    install -Dm 644 item_archlinuxpkgs.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 item_todo.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 item_unicode.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 layout.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 preview.xml -t "${pkgdir}/etc/xdg/walker/themes/default"
    install -Dm 644 style.css -t "${pkgdir}/etc/xdg/walker/themes/default"
}
