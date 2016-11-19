# Maintainer: oke3 <Sekereg at gmx dot com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=mp3blaster
pkgver=3.2.5
pkgrel=4
pkgdesc="A console based mp3 and OGG player"
arch=('i686' 'x86_64')
url="http://mp3blaster.sourceforge.net"
license=('GPL')
depends=('ncurses' 'libvorbis' 'sdl' 'libsidplay')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        'mp3blaster-gcc43.patch')
sha1sums=('6a0fc892e0739a409735e85b18089c0e25fcc577'
          '104a732375a2d436e1fde0e5b78ccfd48f8b497a')

prepare() {
  cd $pkgname-$pkgver

  patch -p0 -i ../mp3blaster-gcc43.patch
}

build() {
  cd $pkgname-$pkgver

  CXXFLAGS+=' -std=gnu++98'

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
