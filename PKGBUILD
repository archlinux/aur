# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=musikcube
pkgver=0.24.0
pkgrel=1
pkgdesc="A terminal-based cross-platform music player, audio engine, metadata indexer, and server"
arch=('x86_64')
url="https://github.com/clangen/$pkgname"
license=('BSD')
conflicts=("$pkgname-git")
depends=('faad2' 'libogg' 'libvorbis' 'flac' 'libmicrohttpd' 'lame' 'ncurses' 'boost' 'pulseaudio' 'libpulse' 'alsa-lib' 'curl')
makedepends=('cmake')
source=(https://github.com/clangen/musikcube/archive/$pkgver.tar.gz
        LICENSE.txt)
sha256sums=('fb13ef249245434ea0624237c5a4cae0ecb1fa6d6054157f3bfc4ffb711428c5'
            'f6b4cd2e08c8a93cd447eb4a077ecb0c7eca8c3d175aaeedb1f49731f86c8e5b')

build() {
  cd $pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR=$pkgdir install
  install -Dm644 $srcdir/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
