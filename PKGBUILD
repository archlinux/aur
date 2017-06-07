# Contributor: Alexander Mamzikov <av.mamzikov@gmail.com>

pkgname=stereophotoview
pkgver=1.5.1
pkgrel=1
pkgdesc="Viewer/editor for stereoscopic photo, and viewer for stereoscopic video"
arch=('i686' 'x86_64')
url="https://stereophotoview.bitbucket.io"
license=('GPL3')
groups=()
depends=(libpng qt5-base qt5-declarative ffmpeg)
makedepends=(qt5-base qt5-tools qt5-declarative qt5-multimedia qt5-quickcontrols ffmpeg)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=.install
source=(https://bitbucket.org/av-mamzikov/stereophotoview/get/${pkgver}.zip)
noextract=()
md5sums=('d46deaf2a52a183bb469f60142f15830') #generate with 'makepkg -g'

build() {
  cd "$srcdir"
  test -d build || mkdir build
  cd build
  qmake NoPostInstall=1 PREFIX=${pkgdir}/usr ../av-mamzikov-stereophotoview-*
  make
}

package()
{
  cd "$srcdir/build"
  make install
  sed -i -e 's:Icon=stereophotoview/appicon.svg:Icon=/usr/share/pixmaps/stereophotoview/appicon.svg:' "${pkgdir}/usr/share/applications/stereophotoview.desktop"
}
