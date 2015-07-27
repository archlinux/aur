# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

_pkgname=sview
pkgname=$_pkgname-git
pkgver=14.09.beta.r181.ga4aafb2
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal')
optdepends=('ttf-droid' 'ttf-nanum')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/gkv311/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd $_pkgname
  unset ANDROID_NDK
  msg2 "Starting make..."
  make clean
  make -j1 all
}

package() {
  cd $_pkgname
  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
  cp LICENSE $pkgdir/usr/share/licenses/$_pkgname/
}
