# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

pkgname=sview
_pkgver=16_06
pkgver=16.06
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal')
optdepends=('ttf-droid' 'ttf-nanum')
source=("https://github.com/gkv311/sview/archive/$_pkgver.tar.gz")
sha256sums=('d5c0fd8abe80a8752609b88f13f4f041ac156d32fd0368e4d1d7603d79c25d91')

build() {
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
