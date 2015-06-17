
pkgname=gegl-legacy
_pkgname=gegl
pkgver=0.1.8
pkgrel=1
pkgdesc="Graph based image processing framework, leagcy version of 0.1.8"
arch=('i686' 'x86_64')
url="http://www.gegl.org/"
license=('GPL3' 'LGPL3')
depends=('babl-legacy' 'gtk2')
conflicts=('gegl')
provides=('gegl')
makedepends=('ruby' 'lua' 'openexr' 'ffmpeg' 'librsvg' 'jasper' 'exiv2')
optdepends=('openexr: for using the openexr plugin' \
            'ffmpeg: for using the ffmpeg plugin' \
            'librsvg: for using the svg plugin' \
            'jasper: for using the jasper plugin')
options=('!libtool')
source=(ftp://ftp.gimp.org/pub/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2 )

sha1sums=('3d4d902580f5c5122b01b5188b6b5da03089ecac')
#sha1sums=('27bedcfd077da7a6913b82966dbec904b22c121d')

build() {
  export XDG_DATA_DIRS=$${pkgdir}/share/
  export PKG_CONFIG_PATH=${pkgdir}/lib/pkgconfig:$PKG_CONFIG_PATH
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure  --prefix=/usr  --with-sdl --with-openexr --with-librsvg \
    --with-libavformat --with-jasper --disable-docs --program-suffix=legacy
  make
}

#check() {
#  cd "${srcdir}/${_pkgname}-${pkgver}"
#  make check
#}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
