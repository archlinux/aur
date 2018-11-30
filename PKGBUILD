# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=mapsoft
pkgver=20180722
pkgrel=2
pkgdesc='Programs for working with maps and geodata'
arch=('i686' 'x86_64')
url='http://slazav.mccme.ru/prog/mapsoft.htm'
license=('GPL')
depends=('curl' 'giflib4' 'gtkmm' 'libjpeg-turbo' 'libtiff' 'libusb' 'libxml2' 'libyaml' 'libzip' 'proj')
makedepends=('boost' 'netpbm' 'perl' 'scons' 'transfig')
source=("https://github.com/ushakov/${pkgname}/archive/${pkgver}-alt1.tar.gz"
        'mapsoft_mapview.desktop'
        'scons.patch')
sha256sums=('1dfab671946550c6fe52add9d2c76f342025d3aa628cf70c26553f306ff08737'
            'f6b0c49271c21f44e2f007b3096c0d80e662c0dc9ff8b66e60c82402b1826096'
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
  install -Dm644 ../mapsoft_mapview.desktop ${pkgdir}/usr/share/applications/mapsoft_mapview.desktop
}
