# Maintainer: gesh <gesh AT gesh DOT uni DOT cx>

pkgname=stack-clean-old-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.5.r0.g1af052f
pkgrel=1
pkgdesc='Manage Haskell stack snapshot builds and ghc versions (static build)'
arch=('i686' 'x86_64')
url="https://github.com/juhp/${_pkgname}"
license=('BSD')
provides=("$_pkgname")
depends=('gmp')
makedepends=('stack')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
}

build() {
    cd "$_pkgname"
    stack setup
    stack build
}

check() {
    cd "$_pkgname"
    stack test
}

package() {
    cd "$_pkgname"
    stack install --local-bin-path "${pkgdir}/usr/bin"
}
