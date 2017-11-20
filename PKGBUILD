# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

pkgname=sview
_pkgver=17_04
pkgver=17.04
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal')
optdepends=('ttf-droid' 'ttf-nanum')
source=("https://github.com/gkv311/sview/archive/$_pkgver.tar.gz"
        "glibc_2.26.patch")
sha256sums=('630ecf1a5f9af062d4b666ba23fdc0c43b2e12dcd61e3635530b712c90e9886e'
            '1299f01c451f170ce24db08cf5505f5abdd24bac578e1166cac4344a66dcd4fe')

build() {
  patch -p1 < glibc_2.26.patch
  cd $pkgname-$_pkgver
  unset ANDROID_NDK
  msg2 "Starting make..."
  make -j1 all
}

package() {
  cd $pkgname-$_pkgver
  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
  cp LICENSE.md license* $pkgdir/usr/share/licenses/$_pkgname/
}
