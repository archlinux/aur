# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: sxe <sxxe@gmx.de>

pkgname=ffmpegthumbs-mattepaint
pkgver=0.7
pkgrel=4
pkgdesc="An alternative version of the standard KDE ffmpegthumbs."
arch=('x86_64')
url="http://kde-look.org/content/show.php/FFMpegThumbs-MattePaint?content=153902"
license=('GPL')
depends=('kio' 'libavcodec.so' 'libavfilter.so' 'libavformat.so' 'libavutil.so' 'libswscale.so')
makedepends=('extra-cmake-modules')
source=("https://download.opensuse.org/repositories/home:/Gribs:/Tools/openSUSE_Leap_42.1/src/$pkgname-$pkgver-5.3.src.rpm"
        'imagewriter.patch')
sha256sums=('6acf0b3b7a002499ebda1b034457443200ef4322a52e33045d1b970906455c9a'
            '055eb84f93914b5adc39a703bf3a399bdfd68b126839fb4ffe90ef80c203158c')

prepare() {
  mkdir -p build
  bsdtar -zxvf $pkgname-$pkgver.tar.gz
  cd "$pkgname-$pkgver"
  patch -p1 -i ../imagewriter.patch
}

build() {
  cd build
  cmake ../"$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

package() {
  make -C build DESTDIR=$pkgdir install
}
