
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=libnma-git
pkgver=1.8.27.dev.r5.fa19e6ee
pkgrel=1
pkgdesc="Necessary for Network Manager UI"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/libnma"
license=('GPL2')
depends=('gcr' 'libnm')
makedepends=('git' 'meson' 'mobile-broadband-provider-info' 'iso-codes' 'gobject-introspection' 'gtk-doc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
source=('git+https://gitlab.gnome.org/GNOME/libnma')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'  )"

}

build() {
  arch-meson libnma build
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
}
