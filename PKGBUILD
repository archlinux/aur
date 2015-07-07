# Maintainer: Steffen Weber <-boenki-gmx-de->

pkgname=ffdiaporama
pkgver=2.1
pkgrel=3
pkgdesc="Movie creator from photos and video clips"
arch=('i686' 'x86_64')
url="http://ffdiaporama.tuxfamily.org"
license=('GPL2')
conflicts=('ffdiaporama-devel')
depends=('qt5-svg' 'qt5-tools' 'qt5-imageformats' 'ffmpeg' 'exiv2' 'shared-mime-info' 'ffdiaporama-rsc')
optdepends=('ffdiaporama-texturemate: Additional background-images'
            'ffdiaporama-openclipart: use the openclipart-library')
install=$pkgname.install
source=(http://download.tuxfamily.org/ffdiaporama/Packages/Stable/ffdiaporama_bin_2.1.2014.0209.tar.gz
        cDeviceModelDef.patch
        EncodeVideo2.cpp.patch)
md5sums=('f9f46277153cf49f6947973778516adb'
         'f4ae4748072a4ade0db2e816fbfa3dbb'
         '5924f4a2b48968839722252ad677437d')

prepare() {
  cd ffDiaporama
  patch -p0 -i ../cDeviceModelDef.patch
  patch -p0 -i ../EncodeVideo2.cpp.patch
}

build() {
  cd ffDiaporama
  qmake-qt5 ffDiaporama.pro
  make
}

package() {
  cd ffDiaporama
  make install INSTALL_ROOT=$pkgdir
  find $pkgdir/usr/share -type f -exec chmod 644 {} +
}
