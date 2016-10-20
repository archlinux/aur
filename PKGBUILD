# Maintainer: shmilee <echo c2htaWxlZS56anVAZ21haWwuY29tCg==|base64 -d>

_pkgname=sregex
pkgname=sregex-git
pkgver=r221.b1bf5b6
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A non-backtracking NFA/DFA-based Perl-compatible regex engine matching on large data streams."
url="https://github.com/openresty/sregex"
depends=('glibc')
provides=("$_pkgname")
license=('custom:BSD')
source=("git+https://github.com/openresty/sregex")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkgname"

  make PREFIX=/usr DESTDIR="$pkgdir" install 

  install -Dm644 "$srcdir/$_pkgname/LICENSE" \
      "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
