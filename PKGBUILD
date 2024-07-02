# Previous Maintainer: Daniel Nagy <danielnagy at gmx de>
# Maintainer: s3rj1k <evasive dot gyron at gmail dot com>
# Hint: don't forget to run `makepkg --printsrcinfo > .SRCINFO`

pkgname=libinjection-git
_pkgname=${pkgname%-git}
pkgver=3.10.0.69.g73268cf
pkgrel=1
pkgdesc="A library for detecting SQL injection attacks"
arch=('x86_64')
url="https://github.com/libinjection/libinjection"
license=('BSD')
options=("!strip")
depends=('glibc')
makedepends=('git' 'autoconf' 'automake' 'libtool')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/libinjection"
  git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$srcdir/libinjection"
  ./autogen.sh
}

build() {
  cd "$srcdir/libinjection"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static
  make
}

package() {
  cd "$srcdir/libinjection"
  make DESTDIR="$pkgdir/" install
}
