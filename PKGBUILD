# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=equate-git
_pkgname=${pkgname%-git}
pkgver=0.99.0.14.ef2273a
pkgrel=1
pkgdesc="Calculator based on EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('MIT')
depends=('elementary')
makedepends=('git')
source=("git://git.enlightenment.org/apps/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  for i in v_maj v_min v_mic; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done

  echo $_v_maj.$_v_min.$_v_mic.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/$_pkgname/README"
  install -Dm644 README.edje "$pkgdir/usr/share/$_pkgname/README.edje"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 COPYING-PLAIN "$pkgdir/usr/share/licenses/$pkgname/COPYING-PLAIN"
}

