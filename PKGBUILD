pkgname=amarok-ffmpeg4.4
pkgver=2.9.71
pkgrel=1
pkgdesc="The powerful music player for KDE"
arch=("x86_64")
url="http://${pkgname}.kde.org/"
license=("FDL" "GPL2" "LGPL2.1")
depends=("kcmutils" "kdoctools" "kdnssd" "kirigami2" "knewstuff" "ktexteditor" "liblastfm-qt5" "libofa" "mariadb" "phonon-qt5" "qt5-script" "qt5-tools" "qt5-webengine" "taglib-extras" "threadweaver" "ffmpeg4.4")
makedepends=("extra-cmake-modules" "gdk-pixbuf2" "git" "knotifyconfig" "loudmouth")
optdepends=(
  "ifuse: support for Apple iPod Touch and iPhone"
  "loudmouth: backend needed by mp3tunes for syncing"
)
provides=(amarok)
conflicts=(amarok)
source=("https://download.kde.org/unstable/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=("6a404829d336f69415fb6bb4ea1d5566759fb95e3e84f904ee9ef82a7be4e84f")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF -DPC_LIBAVCODEC_INCLUDEDIR=/usr/include/ffmpeg4.4 -DPC_LIBAVCODEC_LIBDIR=/usr/lib/ffmpeg4.4 -DPC_LIBAVFORMAT_INCLUDEDIR=/usr/include/ffmpeg4.4 -DPC_LIBAVFORMAT_LIBDIR=/usr/lib/ffmpeg4.4 -DPC_LIBAVUTIL_INCLUDEDIR=/usr/include/ffmpeg4.4 -DPC_LIBAVUTIL_LIBDIR=/usr/lib/ffmpeg4.4
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
