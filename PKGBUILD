# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>

pkgname=gnubg
pkgver=1.03.001
pkgrel=1
pkgdesc="A world class backgammon application"
arch=('i686' 'x86_64')
url="http://www.gnubg.org"
license=('GPL')
depends=('python2' 'gtkglext' 'hicolor-icon-theme')
install=$pkgname.install
source=($url/media/sources/$pkgname-release-$pkgver-sources.tar.gz
        $pkgname.desktop)
md5sums=('9b04110dcee6eb1297d2d11992525737'
         '965f5c7c25f60b27d06cc6fef7befd30')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  ./autogen.sh

  ./configure --prefix=/usr --bindir=/usr/bin --sysconfdir=/etc \
    --mandir=/usr/share/man --enable-simd=sse2

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir"/ install

  install -Dm644 "$srcdir"/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}
