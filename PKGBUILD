# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=mapsoft
pkgver=20191110
pkgrel=1
pkgdesc='Programs for working with maps and geodata'
arch=(x86_64)
url='http://slazav.mccme.ru/prog/mapsoft.htm'
license=('GPL')
depends=('curl' 'giflib' 'gtkmm' 'libjpeg-turbo' 'libtiff' 'libusb' 'libxml2' 'libyaml' 'libzip' 'proj' 'shapelib' 'imagemagick')
makedepends=('boost' 'netpbm' 'perl' 'scons' 'transfig')
source=("https://github.com/ushakov/${pkgname}/archive/${pkgver}-alt1.tar.gz"
        'scons.patch')
sha256sums=('42e5aa27e8fcf771409cf21a3cac41ca0a2c886b24c95c81f2dc37106257bf29'
            'f36cc4f1fc1e089d4b834338699170d38d37c47ba4c76ec9df2005b0993524ef')

prepare() {
  cd ${pkgname}-${pkgver}-alt1

  patch -Np1 < ../scons.patch
}

build() {
  cd ${pkgname}-${pkgver}-alt1

  scons -j1 -Q prefix=${pkgdir} -Q minimal=1
}

package() {
  cd ${pkgname}-${pkgver}-alt1

  scons -j1 -Q prefix=${pkgdir} install
}
