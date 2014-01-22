# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: dale <dale@archlinux.org>

pkgname=prboom
pkgver=2.5.0
pkgrel=7
arch=('i686' 'x86_64')
pkgdesc='A game engine which provides a program to play Doom levels.'
url='http://prboom.sourceforge.net/'
license=('GPL2')
depends=('libpng' 'sdl_mixer' 'sdl_net' 'glu')
makedepends=('mesa')
source=("http://downloads.sourceforge.net/prboom/$pkgname-$pkgver.tar.gz"
        'libpng-1.4.patch')
sha256sums=('226c1c470f8cc983327536404f405a1d026cf0a5188c694a1243cc8630014bae'
            'eb3b41139b8269f9223b084f8444e306dac60dc6fc190d7fabf41b162adca385')

prepare() {
  cd $pkgname-$pkgver

  # path fix
  sed "s|/games|/bin|g" -i src/Makefile.in
  # allow building with newer libpng
  patch -p1 < ../libpng-1.4.patch
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --disable-i386-asm
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
