# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
_pkgname=pcg-cpp
pkgname="${_pkgname}-git"
pkgver=0.98.1.r36.gb656278
pkgrel=1
pkgdesc='A family of fast, statistically excellent algorithms for random number generation.'
arch=('any')
url='http://www.pcg-random.org/'
license=('Apache' 'MIT')
makedepends=('git')
source=('fix-makefile.patch'
        "git+https://github.com/imneme/${_pkgname}.git")
sha256sums=('3867f1a75bf30b4aa73c2ab0b5e821fc8764a8d7bb20f6a44f12bc1b1477d361'
            'SKIP')
provides=("${_pkgname}")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 <../fix-makefile.patch
}

build() {
  cd "$_pkgname"
  make
}

check() {
  cd "$_pkgname"
  make test
}

package() {
  cd "$_pkgname"
  mkdir -p "$pkgdir/usr/include"
  make install PREFIX="$pkgdir/usr"
  install -m644 -D 'LICENSE-MIT.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
