# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=mapsoft
pkgver=20180722
pkgrel=1
pkgdesc='Programs for working with maps and geodata'
arch=('i686' 'x86_64')
url='http://slazav.mccme.ru/prog/mapsoft.htm'
license=('GPL')
depends=('cairomm' 'curl' 'giflib4' 'gtkmm' 'libjpeg-turbo' 'libpng' 'libtiff' 'libusb' 'libxml2' 'libyaml' 'libzip' 'pixman' 'proj' 'zlib')
makedepends=('boost' 'netpbm' 'perl' 'scons' 'transfig')
source=("https://github.com/ushakov/${pkgname}/archive/${pkgver}-alt1.tar.gz"
        'scons.patch')
sha256sums=('1dfab671946550c6fe52add9d2c76f342025d3aa628cf70c26553f306ff08737'
            '4c39ef1b6ae1b6ff4726a04929270dbf9a86b7c7016040cd855a81951afbfbf4')

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
