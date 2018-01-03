# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

pkgname=sview
_pkgver=45f47e162a173db9645a734911753ac7f3192fe6
pkgver=17.10
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal')
optdepends=('ttf-droid' 'ttf-nanum')
source=("https://github.com/gkv311/sview/archive/$_pkgver.tar.gz")
sha256sums=('a8b3dd8ad17e055ca9ebdf4cd96209b3d2b9b9805c15527fe48989cf08575d09')

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
