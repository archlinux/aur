# Maintainer:         Alexander Blinne "Sunday" <alexander at blinne dot net>

_pkgname=sview
pkgname=$_pkgname-git
pkgver=20.08.r31.ga255e0d4
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
  # this is the version according to AndroidManifest.xml, however no tag was set by the original author
  git tag -f 19_08 49eb8a009d563ed498ad64960f17a5b98fd74a19
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
