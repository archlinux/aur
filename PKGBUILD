# Maintainer: Piroro-hs

pkgname=gsettings-desktop-schemas-nofont
pkgver=45.0
pkgrel=1
pkgdesc='Shared GSettings schemas for the desktop, patched to drop font dependencies'
arch=('any')
url="https://gitlab.gnome.org/GNOME/${pkgname%-nofont}"
license=('GPL')
groups=()
depends=('dconf' 'glib2')
makedepends=('git' 'gobject-introspection' 'meson')
provides=("${pkgname%-nofont}")
conflicts=("${pkgname%-nofont}")
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+$url.git#tag=$pkgver"
        "0001-Revert-default-font.patch")
noextract=()
sha256sums=('SKIP'
            '70823e18b0b35f698890cee555afee794e805750e798e0c76a1f0d456aaf587d')

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 -i "../0001-Revert-default-font.patch"
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
