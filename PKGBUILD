# Maintainer: Erik Hedlund <erikcghedlund at outlook dot com>
_pkgname=erlfmt
pkgname=${_pkgname}-git
pkgver=1.6.0.r0.g94e6c0d
pkgrel=1
pkgdesc="An automated code formatter for Erlang"
arch=('any')
url="https://github.com/WhatsApp/erlfmt"
license=('Apache-2.0')
depends=('erlang-core')
optdepends=()
conflicts=()
provides=('erlfmt')
makedepends=('git' 'rebar3')
source=("$_pkgname::git+https://github.com/WhatsApp/erlfmt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  rebar3 as release escriptize
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm0755 "./_build/release/bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
