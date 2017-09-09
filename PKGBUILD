# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=8.4.3
pkgrel=1
pkgdesc="Full-featured atomic-scale first-principles simulation software."
arch=('i686' 'x86_64')
url="https://www.abinit.org/"
license=('GPLv3')
depends=('lapack' 'blas' 'openmpi' 'atompaw')
makedepends=('gcc-fortran' 'perl')
source=(
  "https://www.abinit.org/sites/default/files/packages/$pkgname-$pkgver.tar.gz"
  random_seed.patch
)

prepare() {
  # See https://forum.abinit.org/viewtopic.php?f=3&t=3615
  patch "$srcdir/$pkgname-$pkgver/src/67_common/m_vcoul.F90" < "$srcdir/random_seed.patch"
}

build() {
  cd -- "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr #--disable-all-plugins
  make
}

package() {
  cd -- "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha512sums=('973502a1e8aa575cb3176b021be124ebc856e85ab98037f7e9656caa439853629eb0d96c05ccf871d60c1efa36c2dd776975a977415fe53c9908d78818be1ebb'
            '4ebf3ae37387e5dcb2cfcd6fa2fc4f250f7a827f7b0be34585817d2fcd69de14bbc2aeb68e433e41899e5beffbf18576608d592aa02e07100da47b25170038d5')
