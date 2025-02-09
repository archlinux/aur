# Maintainer: Erik Hedlund <erikcghedlund at outlook dot com>
_pkgname=gradualizer
pkgname=${_pkgname}-git
pkgver=0.3.0.r49.g112646d
pkgrel=1
pkgdesc="A Gradual type system for Erlang"
arch=('any')
url="https://github.com/josefs/Gradualizer"
license=('MIT')
depends=('erlang-core')
optdepends=()
conflicts=()
provides=('gradualizer')
makedepends=('git' 'make' 'erlang-syntax_tools')
source=("$_pkgname::git+https://github.com/josefs/Gradualizer.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make escript
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm0755 "./bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
