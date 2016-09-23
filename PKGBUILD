# $Id: PKGBUILD 187460 2016-08-24 16:03:31Z jlichtblau $
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Alois Nespor <alois.nespor@gmail.com>

pkgname=kid3-cli
pkgver=3.4.2
pkgrel=1
pkgdesc="An MP3, Ogg/Vorbis and FLAC tag editor, CLI version"
arch=('i686' 'x86_64')
url="http://kid3.sourceforge.net/"
license=('GPL')
depends=('chromaprint' 'id3lib' 'taglib' 'libmp4v2' 'qt5-multimedia')
makedepends=('chromaprint' 'id3lib' 'taglib' 'libmp4v2'
             'hicolor-icon-theme' 'docbook-xml' 'extra-cmake-modules' 'python')
conflicts=('kid3-kde'' kid3-qt')
provides=('kid3')
changelog=${pkgname/-cli/}.changelog
source=(http://downloads.sourceforge.net/${pkgname/-cli/}/${pkgname/-cli/}-$pkgver.tar.gz)
sha256sums=('5c0707f1be73c486d09522ca086693d3ee830b7a28a88dbd2c010c5494256a3e')

build() {
  mkdir -p ${srcdir}/build
  cd "${srcdir}"/build
  cmake \
    ../${pkgname/-cli/}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWITH_APPS="CLI" \
    -DWITH_QML=OFF \
    -DWITH_MP4V2=ON \
    -DWITH_FFMPEG=ON \
    -DWITH_GSTREAMER=OFF

}

package() {
  cd "$srcdir"/build
  make DESTDIR="${pkgdir}" install
}
