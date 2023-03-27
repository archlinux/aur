# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

pkgname=sview
_pkgver=301eccf5f81e0483710e01ec477906a13fb8988b
pkgver=23.02
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal' 'ttf-droid' 'gnu-free-fonts')
optdepends=('ttf-nanum')
source=("https://github.com/gkv311/sview/archive/$_pkgver.tar.gz")
sha256sums=('50b51e897251c2f2b91e605b8c41b32f59dc77d36b18a9eb20927938e43ea2d4')

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
  cp docs/LICENSE.md $pkgdir/usr/share/licenses/$_pkgname/
}
