# Maintainer: boenki <boenki at gmx dot de>

pkgname=ffdiaporama
pkgver=2.2.D759
pkgrel=2
pkgdesc="Movie creator from photos and video clips"
arch=('i686' 'x86_64')
url="http://ffdiaporama.tuxfamily.org"
license=('GPL2')
depends=('qt5-svg' 'qt5-tools' 'qt5-imageformats' 'qt5-multimedia' 'ffmpeg' 'pulseaudio' 'exiv2' 'shared-mime-info')
optdepends=('ffdiaporama-texturemate: Additional background-images'
            'ffdiaporama-openclipart: use the openclipart-library')
provides=('ffdiaporama-rsc')
source=(http://download.tuxfamily.org/ffdiaporama/Packages/Devel/ffdiaporama_bin_2.2.devel.2014.0701.tar.gz
        http://download.tuxfamily.org/ffdiaporama/Packages/Devel/ffdiaporama_rsc_2.2.devel.2014.0503.tar.gz
        ffmpeg3.0.patch)
md5sums=('0ca946d8db68467aefec39917e2dbb4d'
         '37bfd8ba62dac8dcbde679aee29a7aad'
         '945d2bc188a41d81542b18f44eeeb6bd')

prepare() {
  cd ffDiaporama
  patch -p1 -i ../ffmpeg3.0.patch
}

build() {
  cd ffDiaporama
  qmake-qt5 ffDiaporama.pro
  make

  cd ../ffDiaporama_rsc
  qmake-qt5 ffDiaporama_rsc.pro
  make
}

package() {
  cd ffDiaporama
  make install INSTALL_ROOT=$pkgdir
  find $pkgdir/usr/share -type f -exec chmod 644 {} +

  cd ../ffDiaporama_rsc
  make install INSTALL_ROOT=$pkgdir
}
