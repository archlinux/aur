# Maintainer: Alexander Hunziker <alex.hunziker@gmail.com>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=gegl-git
pkgver=GEGL_0_3_0.34.gd0bfae0
pkgrel=1
pkgdesc="Graph based image processing framework"
arch=('i686' 'x86_64')
url="http://www.gegl.org"
license=('GPL3' 'LGPL3')
groups=()
depends=('babl-git' 'libspiro')
makedepends=('git' 'intltool' 'lua' 'openexr' 'ffmpeg' 'librsvg' 'jasper' 'libopenraw')
optdepends=('openexr: for using the openexr plugin' \
            'ffmpeg: for using the ffmpeg plugin' \
            'librsvg: for using the svg plugin' \
            'jasper: for using the jasper plugin' \
            'libopenraw: for using the openraw plugin' )
provides=()
conflicts=()
replaces=()
backup=()
options=(!libtool)
install=
source=(git://git.gnome.org/gegl)
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot=GITURL
_gitname=gegl

build() {
  cd "$srcdir/$_gitname"

  ./autogen.sh
  ./configure --prefix=/usr --prefix=/usr  --with-sdl --with-openexr --with-librsvg \
    --with-libavformat --with-jasper --disable-docs
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/bin/gegl $pkgdir/usr/bin/gegl-0.3
}

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}
