# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Maintainer: Vitaly Ankh <vitalyankh@gmail.com>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=libnma-git
pkgver=1.8.35.dev.r1.4358ff66
pkgrel=1
pkgdesc="Necessary for Network Manager UI"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/libnma"
license=('GPL2')
depends=('gcr' 'libnm')
makedepends=('git' 'meson' 'mobile-broadband-provider-info' 'iso-codes' 'gobject-introspection' 'gtk-doc')
provides=("${pkgname%-git}" 'libnma-common')
conflicts=("${pkgname%-git}" 'libnma-common')
options=()
source=('git+https://gitlab.gnome.org/GNOME/libnma')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'  )"

}

build() {
  arch-meson libnma build -D libnma_gtk4=true
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
}
