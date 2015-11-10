# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

pkgname=sview
_pkgver=15.10-1
pkgver=15.10.1
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal')
optdepends=('ttf-droid' 'ttf-nanum')
source=("http://download.sview.ru/src/sview-$_pkgver.tar.gz")
sha256sums=('6cdf9e31c26b607914954ec821d164c58f707742e4a0d3a2cae9a8246abc667c')


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
  cp LICENSE license* $pkgdir/usr/share/licenses/$_pkgname/
}
