# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Stefan Clarke <fm0nk3y@yahoo.co.uk>

pkgname=gnubg
pkgver=1.04.000
pkgrel=1
pkgdesc="World class backgammon application"
arch=('i686' 'x86_64')
url="http://www.gnubg.org"
license=('GPL3')
depends=('python2' 'gtkglext' 'hicolor-icon-theme')
install=$pkgname.install
source=($url/media/sources/$pkgname-release-$pkgver-sources.tar.gz
        $pkgname.desktop)
md5sums=('c83b54e74131c7765339569cea3c2994'
         '965f5c7c25f60b27d06cc6fef7befd30')

build() {
  cd $pkgname-$pkgver

  ./autogen.sh

  ./configure --prefix=/usr --bindir=/usr/bin --sysconfdir=/etc \
    --mandir=/usr/share/man --enable-simd=sse2

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname.desktop \
    "$pkgdir"/usr/share/applications/$pkgname.desktop
}
