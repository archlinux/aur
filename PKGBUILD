# Maintainer: zlfn <elusive1102@naver.com>

pkgname=krita-plus-bin
pkgver=v5.1.0.prealpha.r2174.g82766ef025
pkgrel=1
pkgdesc='The pre-built package of Krita Plus. If you do not trust me, intall krita-plus-git instead.'
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
source=('krita::git+https://github.com/KDE/krita.git#branch=krita/5.1')
sha512sums=('SKIP')

pkgver() {
  cd krita 
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  cd ..
  cd ..
  echo $pkgver > pkgver
  echo $pkgrel > pkgrel

}

build() {
  cmake -B build -S krita \
    -DBUILD_TESTING=OFF \
    -DBUILD_KRITA_QT_DESIGNER_PLUGINS=ON
  cmake --build build -j 4
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
