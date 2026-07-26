# Maintainer: Ben Ruijl <benruyl@gmail.com> 
# Maintainer: Magnus Schaaf <magnusschaaf plus arch at gmail dot com>
pkgname=form
_pkgid=${pkgname}
pkgver=5.0.1
pkgrel=1
pkgdesc="Symbolic Manipulation System developed at Nikhef."
arch=('i686' 'x86_64')
url="https://www.nikhef.nl/~form/"
license=('GPL-3.0-or-later')
depends=('gmp>=4.2' 'zlib>=1.2')
makedepends=('autoconf' 'automake')  # included in `base-devel`
optdepends=('zstd' 'mpfr' 'flint')
provides=('tform')
conflicts=('form-git')
source=("https://github.com/form-dev/form/releases/download/v${pkgver}/form-${pkgver}.tar.gz")
sha256sums=('ce62530a54e5232dfefb6c1ff0e7047372a43941b3c0e0db08b5714fd868722c')

build() {
	cd $_pkgid-$pkgver
	autoreconf -i
	./configure --prefix=/usr
	make ${MAKEFLAGS}
}

package() {
	cd $_pkgid-$pkgver
	make DESTDIR="$pkgdir" install
}
