# Contributor: Ed Sandberg <scarypezsanta@gmail.com>
# Maintainer: Xyne

pkgname=abinit
pkgver=8.4.4
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

sha512sums=('1dd090df19658a4df3be5d8e95d09b2caed19ce6eab690a79f358cfedfc9777406cea31b9cd0cdc51338e30d6d4dd876d9b34d002f3f88f445e9595c260f801c'
            '4ebf3ae37387e5dcb2cfcd6fa2fc4f250f7a827f7b0be34585817d2fcd69de14bbc2aeb68e433e41899e5beffbf18576608d592aa02e07100da47b25170038d5')
