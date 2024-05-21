# Maintainer: gesh <gesh AT gesh DOT uni DOT cx>

pkgname=stack-clean-old-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.5.1.r1.g899235a
pkgrel=1
pkgdesc='Manage Haskell stack snapshot builds and ghc versions (static build)'
arch=('i686' 'x86_64')
url="https://github.com/juhp/${_pkgname}"
license=('BSD-3-Clause')
provides=("$_pkgname")
depends=('gmp')
makedepends=('git' 'stack')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    stack config set resolver lts-22.22 # ghc-9.6.5
}

build() {
    cd "$_pkgname"
    stack build
}

check() {
    cd "$_pkgname"
    stack test
}

package() {
    cd "$_pkgname"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
