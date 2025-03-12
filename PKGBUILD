# Maintainer: David Adler <d.adler@posteo.de>
pkgname=jpmidi
pkgver=0.21
pkgrel=6
pkgdesc="SMF player for JACK MIDI with transport sync"
arch=('x86_64')
url="https://github.com/jerash/jpmidi"
license=('GPL')
depends=('jack' 'glib2' 'readline')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('6f0484be7dc55d5de88d7532048dd2cb')

prepare() {
    cd $pkgname-$pkgver/$pkgname
    sed -i '460s/return/return 1/' src/commands.c
}

build() {
    cd $pkgname-$pkgver/$pkgname
    ./configure --prefix="/usr" --includedir="/usr/include/jpmidi/"
    make
}

package() {
    cd $pkgname-$pkgver/$pkgname
    make DESTDIR="$pkgdir/" install
}

