# Contributor: Alexander Mamzikov <av.mamzikov@gmail.com>

pkgname=stereophotoview
pkgver=1.0.2
pkgrel=1
pkgdesc="A cross platform stereoscopic photo viewer and editor"
arch=('i686' 'x86_64')
url="https://bitbucket.org/av-mamzikov/stereophotoview"
license=('GPL3')
groups=()
depends=(attr
bzip2
expat
freetype2
gcc-libs
glib2
glibc
graphite
harfbuzz
icu
libcap
libdrm
libffi
libgcrypt
libgpg-error
libpng
libsystemd
libx11
libxau
libxcb
libxdamage
libxdmcp
libxext
libxfixes
libxshmfence
libxxf86vm
lz4
mesa
mesa-libgl
openssl
pcre
qt5-base
qt5-declarative
xz
zlib
)
makedepends=(qt5-base
qt5-tools
qt5-declarative
qt5-multimedia
qt5-quickcontrols
)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=.install
source=(https://bitbucket.org/av-mamzikov/stereophotoview/get/${pkgver}.zip)
noextract=()
md5sums=('ccb2b775ca412549f14c3c8db44eb112') #generate with 'makepkg -g'

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
  sed -i -e 's:"stereophotoview/image-mpo.svg":"/usr/share/pixmaps/stereophotoview/image-mpo.svg":' "${pkgdir}/usr/share/mime/packages/stereophotoview.xml"
}
