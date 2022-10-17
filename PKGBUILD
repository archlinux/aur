# Maintainer: George Peppard <gjp1g21 at soton dot ac dot uk>
pkgname=libfsm-git
pkgver=r2867.6038ae4f
pkgrel=1
arch=('x86_64')
pkgdesc="DFA regular expression library & friends"
url="https://github.com/katef/libfsm"
license=('BSD')
depends=(glibc)
makedepends=(git bmake libxslt docbook-xsl docbook-xml)
provides=(libfsm)
source=('git+https://github.com/katef/libfsm.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libfsm"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
  cd "$srcdir/libfsm"
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/libfsm"
  bmake -r
}

package () {
  cd "$srcdir/libfsm"
  PREFIX="$pkgdir/usr" bmake -r install
  mv "$pkgdir/usr/man" "$pkgdir/usr/share/man"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/libfsm-git/LICENSE"
}