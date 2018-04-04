# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: sxe <sxxe@gmx.de>

pkgname=ffmpegthumbs-mattepaint
pkgver=0.7
pkgrel=3
pkgdesc="An alternative version of the standard KDE ffmpegthumbs."
arch=('x86_64')
url="http://kde-look.org/content/show.php/FFMpegThumbs-MattePaint?content=153902"
license=('GPL')
depends=('kio' 'libavcodec.so' 'libavfilter.so' 'libavformat.so' 'libavutil.so' 'libswscale.so')
makedepends=('extra-cmake-modules')
source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/downloadfile/id/1467623621/s/b05dc6ee78a6106471cd994e86695c6f/t/1522867138/u/40596/153902-Upload2016060900.tar.gz"
        'imagewriter.patch')
sha256sums=('2e4c9fe5e85d9c14b1c468e0dcaecfd71b378ca38f051c0beea6a5f04b5c6cd4'
            'fe67a5f0599bfd53dfe8629d09e7ee39bd41e3877cfb2b0bb77a4c9467cc42b1')

prepare() {
  mkdir -p build
  cd 'Upload2016060900'
  patch -p1 -i ../imagewriter.patch
}

build() {
  cd build
  cmake ../Upload2016060900/KF5/"0.7 using ffmpeg-3.0"/${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  make -C build DESTDIR=$pkgdir install
}
