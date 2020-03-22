# Maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>
_pkgname=RapMap
pkgname=rapmap
pkgver=0.6.0
pkgrel=1
pkgdesc="Rapid sensitive and accurate read mapping via quasi-mapping"

url='https://github.com/COMBINE-lab/RapMap'
arch=('x86_64')

license=('GPL3')
makedepends=('gcc>=4.9' 'clang>=3.4' cmake libdivsufsort cereal)
depends=(gcc-libs)
optdepends=(jemalloc)

source=("$pkgname-$pkgver.tar.gz::https://github.com/COMBINE-lab/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('1ebb4f9b9b0b20cb73cb3663a57e3d8781f1e56953aec6d2f86e4a037dde11f6')

prepare() {
  cd $_pkgname-$pkgver/

  mkdir build
}

build() {
  cd $_pkgname-$pkgver/build

  cmake ..
  make
}

check() {
  $_pkgname-$pkgver/build/src/rapmap -v | grep "^rapmap ${pkgver}$"
}

package() {
  install -Dm755 $_pkgname-$pkgver/build/src/$pkgname "$pkgdir/usr/bin/$pkgname"
}