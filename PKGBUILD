# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>
_pkgname=pcg-cpp
pkgname="${_pkgname}-git"
pkgver=0.98.1.r45.g3191635
pkgrel=1
pkgdesc='A family of fast, statistically excellent algorithms for random number generation.'
arch=('any')
url='http://www.pcg-random.org/'
license=('Apache' 'MIT')
makedepends=('git')
source=("git+https://github.com/imneme/${_pkgname}.git")
sha256sums=('SKIP')
provides=("${_pkgname}")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dm644 -t "$pkgdir/usr/include" include/*.hpp
  install -Dm644 'LICENSE-MIT.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
