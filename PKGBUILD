# Maintainer:  Dimitris Kiziridis <ragourl at outlook dot com>
# Contributor: Paul Staab <develop(at)paulstaab(dot)de>

pkgname=scrm
pkgver=1.7.4
pkgrel=1
pkgdesc="A Coalescent Simulator for Genome-Scale Biological Sequences"
arch=('x86_64')
url="https://scrm.github.io"
license=('GPL3')
depends=('gcc-libs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/scrm/scrm/archive/v${pkgver}.tar.gz")
sha256sums=('13f4b0febabcdf6a2b478693febd2fb9d3f47532fb39ffaa4f01fe816f69ceb7')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  aclocal
  autoconf
  automake -a
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CXX='g++' CXXFLAGS='-O3 -march=native' ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}