# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=mapsoft
pkgver=20190916
pkgrel=3
pkgdesc='Programs for working with maps and geodata'
arch=(x86_64)
url='http://slazav.mccme.ru/prog/mapsoft.htm'
license=('GPL')
depends=('curl' 'giflib' 'gtkmm' 'libjpeg-turbo' 'libtiff' 'libusb' 'libxml2' 'libyaml' 'libzip' 'proj' 'shapelib' 'imagemagick')
makedepends=('boost' 'netpbm' 'perl' 'scons' 'transfig')
source=("https://github.com/ushakov/${pkgname}/archive/${pkgver}-alt2.tar.gz"
        'scons.patch')
sha256sums=('90c28ba478cc7923b368930704ee8ecadebc571380b8f48b11eeddb67b059f25'
            '5c1430eda36cc13aba489e2467f01b101872e066c19982ba2accd3f230a56e96')

prepare() {
  cd ${pkgname}-${pkgver}-alt2

  patch -Np1 < ../scons.patch
}

build() {
  cd ${pkgname}-${pkgver}-alt2

  scons -j1 -Q prefix=${pkgdir} -Q minimal=1
}

package() {
  cd ${pkgname}-${pkgver}-alt2

  scons -j1 -Q prefix=${pkgdir} install
}
