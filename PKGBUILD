# Maintainer: Zack <zack@internetuniverse.org>
pkgname=nautilus-plus
pkgver=50.11
pkgrel=1
pkgdesc="Enhanced GNOME file manager with fast search, animated thumbnails, and more"
arch=('x86_64')
url="https://github.com/johnzfitch/nautilus-plus"
license=('GPL-3.0-or-later')
depends=('glib2' 'gtk4' 'libadwaita' 'gnome-desktop-4' 'libportal-gtk4' 'tracker3' 'gst-plugins-base-libs' 'libcloudproviders' 'gnome-autoar')
optdepends=('search-cache: Fast trigram-indexed file search (highly recommended)')
makedepends=('git' 'meson' 'gobject-introspection' 'libxml2' 'appstream')
provides=('nautilus' 'libnautilus-extension')
conflicts=('nautilus' 'libnautilus-extension')
replaces=('nautilus' 'libnautilus-extension')
install=nautilus-plus.install
source=("git+https://github.com/johnzfitch/nautilus-plus.git#tag=v\${pkgver}")
sha256sums=('SKIP')

build() {
    cd "\$srcdir/nautilus-plus"
    arch-meson build -D docs=false -D tests=none -D packagekit=false -D extensions=false
    meson compile -C build
}

package() {
    cd "\$srcdir/nautilus-plus"
    meson install -C build --destdir "\$pkgdir"
}
