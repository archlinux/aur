# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=mapsoft
pkgver=20190916
pkgrel=1
pkgdesc='Programs for working with maps and geodata'
arch=(x86_64)
url='http://slazav.mccme.ru/prog/mapsoft.htm'
license=('GPL')
depends=('curl' 'giflib' 'gtkmm' 'libjpeg-turbo' 'libtiff' 'libusb' 'libxml2' 'libyaml' 'libzip' 'proj')
makedepends=('boost' 'netpbm' 'perl' 'scons' 'transfig')
source=("https://github.com/ushakov/${pkgname}/archive/${pkgver}-alt1.tar.gz"
        'proj_api.patch'
        'scons.patch')
sha256sums=('ac74bd448da507ff732652d84b2b7400d01092210dfcc2f8c3c35ff93aa09a58'
            '55c44eb94e71c7da87bb9d98f53a72cfa936d7f3380782674b93ec13779e95bc'
            '5c1430eda36cc13aba489e2467f01b101872e066c19982ba2accd3f230a56e96')

prepare() {
  cd ${pkgname}-${pkgver}-alt1

  patch -Np1 < ../proj_api.patch
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
