# Contributor: Dominic Radermacher <blip@mockmoon-cybernetics.ch>
pkgname=mhwaveedit
pkgver=r476.e7caba3
pkgrel=1
pkgdesc="mhWaveEdit is a graphical program for editing, playing and recording sound files."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/magnush/mhwaveedit/"
license=('GPL')
makedepends=('git' 'autoconf')
depends=('gtk2' 'libsndfile' 'libsamplerate')
source=(git://github.com/magnush/mhwaveedit.git)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
build() {
	cd ${srcdir}/${pkgname}
	autoreconf -i
	./configure --prefix=/usr
	make
}
package() {
	cd ${srcdir}/${pkgname}
	make DESTDIR=${pkgdir} install
}
