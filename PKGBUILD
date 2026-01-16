# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt-bin
_pkgname=photoqt
pkgver=5.1
pkgrel=1
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface (binary release)"
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
conflicts=('photoqt' 'photoqt-debug')
provides=('photoqt' 'photoqt-bin-debug')
depends=('exiv2' 'imagemagick' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg' 'qt6-declarative' 'qt6-location' 'qt6-positioning' 'libraw' 'hicolor-icon-theme' 'libarchive' 'kimageformats' 'mpv' 'resvg' 'python-pychromecast' 'qt6-webengine' 'zxing-cpp' 'lcms2' 'devil' 'openmp' 'yaml-cpp' 'qca-qt6')
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
source=(https://photoqt.org/downloads/bin/$_pkgname-$pkgver.tar.gz)
sha256sums=('eb8c844cd612b6d2d8e180f34a2f2db7cd14e751b9b705ab0500d11b5feadfa4')
install="photoqt.install"

  # PhotoQt configured with:
  #
  # cmake .. -DWITH_CHROMECAST=ON -DWITH_DEVIL=ON -DWITH_EXIV2=ON -DWITH_EXTENSIONS_SUPPORT=ON
  #          -DWITH_IMAGEMAGICK=ON -DWITH_LCMS2=ON -DWITH_LIBARCHIVE=ON -DWITH_LIBRAW=ON
  #          -DWITH_LOCATION=ON -DWITH_MOTIONPHOTO=ON -DWITH_PHOTOSPHERE=ON -DWITH_QTPDF=ON
  #          -DWITH_RESVG=ON -DWITH_VIDEO_MPV=ON -DWITH_VIDEO_QT=ON -DWITH_ZXING=ON
  #          -DWITH_GRAPHICSMAGICK=OFF -DWITH_POPPLER=OFF -DCMAKE_BUILD_TYPE=Release

package() {

  cd $srcdir/$_pkgname-$pkgver

  # install binary
  install -Dm0755 -t "$pkgdir/usr/bin/" photoqt

  # install desktop file
  install -Dm0644 -t "$pkgdir/usr/share/applications/" org.photoqt.PhotoQt.desktop

  # install metainfo
  install -Dm0644 -t "$pkgdir/usr/share/metainfo/" org.photoqt.PhotoQt.metainfo.xml

  # install icons
  for size in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
    install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/$size/apps" "icons/$size/org.photoqt.PhotoQt.png"
  done

}
