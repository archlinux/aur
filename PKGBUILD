# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: moostik <mooostik_at_gmail.com>

pkgname="2mandvd"
pkgver="1.8.5"
pkgrel="2"
pkgdesc="DVD Authoring Maker In Linux Environnement"
arch=('i686' 'x86_64')
url="http://2mandvd.tuxfamily.org/"
license=('GPL')
depends=('dvd+rw-tools' 'dvdauthor' 'exif' 'ffmpeg' 'ffmpegthumbnailer' 'glu' 'mencoder' 'mjpegtools' 'mplayer' 'netpbm' 'perl' 'qt4' 'sox' 'transcode' 'ttf-dejavu')
optdepends=('xine-ui: to preview the result')
provides=("${pkgname}")
source=("http://download.tuxfamily.org/${pkgname}/2ManDVD-${pkgver}.tar.gz")
md5sums=('2e9259f4973bc4fd7ae5199c7fdc9f99')

build() {
    cd "${srcdir}/2ManDVD"

    qmake-qt4 2ManDVD.pro

    sed -i "41s|#ifdef|//#ifdef|" videowrapper.cpp
    sed -i '42i #if LIBAVFORMAT_VERSION_MAJOR >= 53' videowrapper.cpp
  
    make
}

package() {
    cd "${srcdir}/2ManDVD"

    sed -i "s|chmod -R 755 /usr/share/2ManDVD|chmod -R 755 \$(INSTALL_ROOT)/usr/share/2ManDVD|" Makefile

    make INSTALL_ROOT=${pkgdir} install
}
