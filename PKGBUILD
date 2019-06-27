# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=tau-editor-git
pkgver=v0.8.1.r104.0523ba8
pkgrel=1
pkgdesc="GTK frontend for the Xi text editor, written in Rus"
arch=(x86_64)
url="https://gitlab.gnome.org/World/tau"
license=('GPL')
depends=('rust'  'xi-core-git' 'glib2' 'pango' 'gtk3' 'cairo' 'gdk-pixbuf2' )
makedepends=('git' 'meson' 'ninja' )
provides=("tau-editor")
conflicts=("tau-editor")
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/tau"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	arch-meson -Dxi-core=system tau build
  ninja -C build
}

#check() {
#	make -k check
#}

package() {
 DESTDIR="$pkgdir/" ninja -C build install
}
