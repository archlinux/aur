# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: sxe <sxxe@gmx.de>

pkgname=ffmpegthumbs-mattepaint
pkgver=0.6
pkgrel=1
pkgdesc="An alternative version of the standard KDE ffmpegthumbs."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php/FFMpegThumbs-MattePaint?content=153902"
license=('GPL')
depends=('ffmpeg2.8' 'kio' 'perl')
makedepends=('extra-cmake-modules')
source=("http://kde-look.org/CONTENT/content-files/153902-${pkgname}.tar.gz")
sha256sums=('83e8a37ffd8a3b5d427a05b8500dbe4e206e30a5fccc3b52ca9e427ddab8b964')

prepare() {
  mkdir -p build
}

build() {
  cd build
  export PKG_CONFIG_PATH="/usr/lib/ffmpeg2.8/pkgconfig"
  cmake ../${pkgname}/KF5/${pkgname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install
}
