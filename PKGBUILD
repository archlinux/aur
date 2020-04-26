# Contributor: sikfeng <sikfeng at gmail dot com>
pkgname=carmel-git
pkgver=forest.em.19.r2154.g03cd860f
pkgrel=1
pkgdesc="finite-state toolkit, EM and Bayesian (Gibbs sampling) training for FST and context-free derivation forests"
arch=("i686" "x86_64")
url="https://github.com/isi-nlp/carmel"
license=("Apache")
depends=("boost")
makedepends=("cmake" "git")
optdepends=("openfst")
provides=("carmel=$pkgver")
source=("$pkgname::git+https://github.com/isi-nlp/carmel.git#branch=master")
md5sums=("SKIP")

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r "s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd $pkgname
  mkdir -p build; cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd $pkgname/build
  make install DESTDIR="$pkgdir"
}

