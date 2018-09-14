# $Id$
# Maintainer: winlu <derwinlu@gmail.com>

_pkgname=rebar3
pkgname=${_pkgname}-git
pkgver=4137.221cbf5c
pkgrel=1
pkgdesc="A sophisticated build-tool for Erlang projects that follows OTP principles."
arch=('any')
url="https://github.com/erlang/rebar3"
license=('APACHE')
depends=('erlang-nox')
optdepends=('rebar3-zsh: ZSH completion')
conflicts=('rebar3')
provides=('rebar3')
makedepends=('git')
source=("$_pkgname::git://github.com/erlang/rebar3.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  HOME="." ./bootstrap
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm0755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm0644 "priv/shell-completion/bash/rebar3" "$pkgdir/usr/share/bash-completion/completions/rebar3"
}
