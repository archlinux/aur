# Maintainer: zlfn <elusive1102@naver.com>

pkgname=krita-next
_pkgver=5.2.0
pkgver=${_pkgver/-/}
pkgrel=2
pkgdesc='Edit and paint images. Krita Plus containing bug fixes on top of the latest 5.0 release.'
arch=(x86_64)
url='https://krita.org'
license=(GPL3)
depends=(kitemviews kitemmodels ki18n kcompletion kguiaddons kcrash qt5-svg qt5-multimedia quazip
         gsl libraw exiv2 openexr fftw openjpeg2 opencolorio libwebp hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools boost eigen vc poppler-qt5 python-pyqt5 libheif
             qt5-tools sip kseexpr libmypaint)
optdepends=('poppler-qt5: PDF filter' 'ffmpeg: to save animations'
            'python-pyqt5: for the Python plugins' 'libheif: HEIF filter'
            'kseexpr: SeExpr generator layer' 'kimageformats: PSD support' 'libmypaint: support for MyPaint brushes'
            'krita-plugin-gmic: GMic plugin')
provides=(krita)
conflicts=(krita)

prepare() {
  git clone https://github.com/KDE/krita.git --single-branch --branch "master"
}

build() {
  cmake -B build -S krita \
    -DBUILD_TESTING=OFF \
    -DBUILD_KRITA_QT_DESIGNER_PLUGINS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
