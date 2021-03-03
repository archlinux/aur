# Maintainer: gesh <gesh AT gesh DOT uni DOT cx>

pkgname=graphmod-git
_pkgname="${pkgname%-git}"
pkgver=1.4.r38.g08302b2
pkgrel=1
pkgdesc="Present the module dependencies of a program as a 'dot' graph"
arch=('i686' 'x86_64')
url="https://github.com/yav/${_pkgname}"
license=('custom')
provides=("$_pkgname")
depends=('gmp')
makedepends=('stack')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  stack build
}

package() {
  cd "${_pkgname}"
  stack install --local-bin-path "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
