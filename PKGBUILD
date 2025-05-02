# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Antoni Przybylik <antoni.przybylik@wp.pl>
# Contributor: Yuval Adam <yuval at y3xz dot com>

pkgname=libosmo-dsp-git
pkgver=0.4.0.r10.gdce124d
pkgrel=1
pkgdesc="Osmocom library with SDR DSP primitives"
arch=('x86_64')
url="https://osmocom.org/projects/libosmo-dsp"
license=('GPL-2.0-or-later')
conflicts=("${pkgname%-git}")
provides=('libosmodsp.so=0-64')
depends=('fftw')
makedepends=('git')
source=("git+https://gitea.osmocom.org/sdr/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR=$pkgdir install
}
