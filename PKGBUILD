pkgname=optizelle
pkgver=1.2.0
pkgrel=1
pkgdesc="library designed to solve general purpose nonlinear optimization problems"
license=('LGPL')
arch=('i686' 'x86_64')
url="http://www.optimojoe.com/products/optizelle/"
depends=('jsoncpp' 'lapack')
makedepends=('cmake')
source=("https://github.com/OptimoJoe/Optizelle/archive/v$pkgver.tar.gz")
sha256sums=('4a0039561d5209f9864795cad827690970113b2ffff5595535539861fd0842ca')

prepare() {
  cd Optizelle-$pkgver
  curl -L https://github.com/OptimoJoe/Optizelle/pull/60.patch | patch -p1
}

build() {
  cd Optizelle-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_OPENMP=ON .
  make
}

package() {
  cd Optizelle-$pkgver
  make DESTDIR="$pkgdir" install
}

