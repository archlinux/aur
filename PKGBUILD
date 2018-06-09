# Maintainer: Frederic Bezies < fredbezies at gmail dot com >

pkgname=quakespasm
pkgver=0.93.1
pkgrel=1
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake. Stable version with optional Mission pack desktop files."
arch=('i686' 'x86_64')
url="http://quakespasm.sourceforge.net"
license=('GPL2')
depends=('libvorbis' 'libmad' 'sdl2')
conflicts=('quakespasm-svn')
install=$pkgname.install
source=(https://sourceforge.net/projects/quakespasm/files/Source/$pkgname-$pkgver.tgz
        $pkgname.desktop
        $pkgname-mp1.desktop
        $pkgname-mp2.desktop
        $pkgname-impel.desktop)
sha1sums=('aca08d7bea6085bc7b755fad1e83ef976b542c1e'
          '7a78889a7a6e24047b4777a8b4827e29cfc87381'
          '2b774f68f889308ba0b8de69580a32ed11f833ec'
          '1184a40775fc46c129828d4a9a35785542c62ee3'
          '2c97f722fc5c9f8d8f1a9a01f55491a448a9253e')

build() {
  cd "$srcdir/$pkgname-$pkgver/Quake/"
  msg "Starting make..."
  make DO_USERDIRS=1 USE_SDL2=1
}

package() {
  cd "$srcdir/$pkgname-$pkgver/Quake/"
  install -Dm755 quakespasm "$pkgdir"/usr/bin/$pkgname
  
  for i in 16 24 32 48 64 72; do
    install -Dm644 $srcdir/$pkgname-$pkgver/Misc/QuakeSpasm_512.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/quakespasm.png
  done

  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
#
# Uncomment lines depending on the mission pack(s)
# or extension you have.
#
# install -Dm644 $srcdir/$pkgname-mp1.desktop $pkgdir/usr/share/applications/$pkgname-mp1.desktop
# install -Dm644 $srcdir/$pkgname-mp2.desktop $pkgdir/usr/share/applications/$pkgname-mp2.desktop
# install -Dm644 $srcdir/$pkgname-impel.desktop $pkgdir/usr/share/applications/$pkgname-impel.desktop

}


