# Maintainer: zlfn <dev@zlfn.space>

pkgname=krita-next-git
pkgver=v5.2.0.prealpha.r62.g01a7589aae
pkgrel=1
pkgdesc='Edit and paint images. Krita Next is a daily build of what will become Krita 5.1. Install at your own risk! It is alpha!'
arch=(x86_64)
url='https://krita.org'
license=(GPL3)
depends=(kitemviews kitemmodels ki18n kcompletion kguiaddons kcrash qt5-svg qt5-multimedia quazip
         gsl libraw exiv2 openexr fftw openjpeg2 opencolorio libwebp hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools boost eigen vc poppler-qt5 python-pyqt5 libheif
             qt5-tools sip kseexpr libmypaint git)
optdepends=('poppler-qt5: PDF filter' 'ffmpeg: to save animations'
            'python-pyqt5: for the Python plugins' 'libheif: HEIF filter'
            'kseexpr: SeExpr generator layer' 'kimageformats: PSD support' 'libmypaint: support for MyPaint brushes'
            'krita-plugin-gmic: GMic plugin')
provides=(krita)
conflicts=(krita)
source=('krita::git+https://github.com/KDE/krita.git#branch=master')
sha512sums=('SKIP')

pkgver() {
  cd krita 
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
