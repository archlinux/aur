# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

_pkgname=sview
pkgname=$_pkgname-git
pkgver=23.02.r0.g301eccf5
pkgrel=1
pkgdesc="Stereoscopic 3D video player with OpenGL UI"
arch=('i686' 'x86_64')
url="http://www.sview.ru/en"
license=('custom')
depends=('libconfig' 'ffmpeg' 'freetype2' 'gtk2' 'libgl' 'libx11' 'libxext' 'libxpm' 'openal' 'ttf-droid' 'gnu-free-fonts')
optdepends=('ttf-nanum')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/gkv311/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git tag -f 23_02 301eccf5f81e0483710e01ec477906a13fb8988b
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd $_pkgname
  unset ANDROID_NDK
  msg2 "Starting make..."
  make -j1 all
}

package() {
  cd $_pkgname
  msg2 "Starting make install..."
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share/licenses/$_pkgname/
  cp docs/LICENSE.md $pkgdir/usr/share/licenses/$_pkgname/
}
