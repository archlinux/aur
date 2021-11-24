# Maintainer: gesh <gesh AT gesh DOT uni DOT cx>

pkgname=graphmod-git
_pkgname="${pkgname%-git}"
pkgver=1.4.r38.g08302b2
pkgrel=2
pkgdesc="Present the module dependencies of a program as a 'dot' graph"
arch=('i686' 'x86_64')
url="https://github.com/yav/${_pkgname}"
license=('custom')
provides=("$_pkgname")
depends=('gmp')
makedepends=('stack')
source=("git+${url}.git" ver-bump.patch)
md5sums=('SKIP'
         '615d958807a2c79c337dcdcf404d593b')

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    patch --forward --strip=1 --input="${srcdir}/ver-bump.patch"
}

build() {
  cd "$_pkgname"
  stack build
}

package() {
  cd "$_pkgname"
  stack install --local-bin-path "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
