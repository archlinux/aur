# Maintainer: WhitedonSAP <ayrtonarantes0987654321ayrt008 at gmail dot com>

pkgname=warehouse
pkgver=1.4.0
pkgrel=1
pkgdesc='A versatile toolbox for managing flatpak user data, viewing flatpak app info, and batch managing installed flatpaks.'
url="https://github.com/flattool/warehouse"
arch=('x86_64')
license=('GPL3')
depends=('flatpak-xdg-utils' 'gtk4' 'python-gobject' 'libadwaita' 'gtk-update-icon-cache' 'desktop-file-utils')
makedepends=('git' 'meson' 'cmake')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c9b25e72d9b46053e61681a2a332c9f734e1d00e3dd12e3af602beb4294b5c66')

prepare() {
    tar xf "${pkgver}.tar.gz" -C "$srcdir" --strip-components=1
    sed -i 's/os_string = GLib.get_os_info("NAME") + " " + GLib.get_os_info("VERSION")/os_string = GLib.get_os_info("NAME")/g' src/main.py
}

build() {
    cd "$srcdir"
    meson setup --prefix /usr build
}

package() {
    cd "$srcdir"
    DESTDIR="$pkgdir" meson install -C build
    chmod +x ${pkgdir}/usr/bin/${pkgname}
}
