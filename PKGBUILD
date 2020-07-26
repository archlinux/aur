# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=8.10.3
pkgrel=2
pkgdesc="Full-featured atomic-scale first-principles simulation software."
arch=('i686' 'x86_64')
url="https://www.abinit.org/"
license=('GPLv3')
depends=('lapack' 'blas' 'openmpi')
makedepends=('gcc8-fortran' 'perl')
source=(
  "https://www.abinit.org/sites/default/files/packages/$pkgname-$pkgver.tar.gz"
)

build() {
  cd -- "$srcdir/$pkgname-$pkgver"
  ./configure FC=gfortran-8 CC=cc-8 --prefix=/usr #--disable-all-plugins
  make -j $(($(nproc) + 1))
}

package() {
  cd -- "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha512sums=('6ae0e1f2e220d51b1f1a6122b81b12664b5148955710945371279ca28a092fd30278c62765b324f85004467c925f1048c20ecec3bb6c38f9f114d0182b647420')
