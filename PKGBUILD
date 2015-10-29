# $Id$
# Maintainer: winlu <derwinlu@gmail.com>

_pkgname=lambdapad
pkgname=${_pkgname}-git
pkgver=117.684a5a9
pkgrel=1
pkgdesc="Static site generator using Erlang. Yes, Erlang."
arch=('any')
url="http://www.lambdapad.io/"
license=('APACHE')
depends=('erlang-nox')
conflicts=()
provides=()
makedepends=('git')
source=("$_pkgname::git://github.com/gar1t/lambdapad.git"
        "lpad-gen")
sha256sums=('SKIP'
            'f336ae9566e924828f1cec89db8c0172063cb7ea40b94c7f3672a5841c2263da')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  mkdir -p "$pkgdir/usr/share/$_pkgname"
  cp -R "$srcdir/$_pkgname/ebin" "$pkgdir/usr/share/$_pkgname/ebin"
  cp -R "$srcdir/$_pkgname/deps" "$pkgdir/usr/share/$_pkgname/deps"
  cp -R "$srcdir/$_pkgname/bin" "$pkgdir/usr/share/$_pkgname/bin"
  cp "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/$_pkgname/"

  install -Dm755 "$srcdir/lpad-gen" "$pkgdir/usr/bin/lpad-gen"
}
