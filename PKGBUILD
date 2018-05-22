# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

pkgname=sview
_pkgver=8be57493b851b8172dcab097fea19e18c46fcc37
pkgver=17.10
pkgrel=2
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal')
optdepends=('ttf-droid' 'ttf-nanum')
source=("https://github.com/gkv311/sview/archive/$_pkgver.tar.gz")
sha256sums=('15418bd4be470f7399ca212869ee9c494bceab9224424b127e5260085f23afe1')

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
