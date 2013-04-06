# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=knc-git
pkgver=20130214
pkgrel=1
pkgdesc="kerberised netcat, provides mutually authenticated tunnel"
arch=('i686' 'x86_64')
url="http://oskt.secure-endpoints.com/knc.html"
license=('MIT')
depends=('krb5')
makedepends=('git')
options=(!libtool)
source=('git+http://oskt.secure-endpoints.com/git/knc')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/knc"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$srcdir/knc"

  autoreconf -f -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/knc"

  make DESTDIR="$pkgdir/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
