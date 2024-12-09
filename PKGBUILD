# Maintainer: Erik Hedlund <erikcghedlund at outlook dot com>
_pkgname=erlfmt
pkgname=${_pkgname}-git
pkgver=525.32b2f06
pkgrel=1
pkgdesc="An automated code formatter for Erlang"
arch=('any')
url="https://github.com/WhatsApp/erlfmt"
license=('Apache-2.0')
depends=('erlang-nox')
optdepends=()
conflicts=()
provides=('erlfmt')
makedepends=('git' 'rebar3')
source=("$_pkgname::git+https://github.com/WhatsApp/erlfmt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  rebar3 as release escriptize
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm0755 "./_build/release/bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
}
