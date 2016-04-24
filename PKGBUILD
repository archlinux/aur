# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>

pkgname=mapsoft
pkgver=20160202
pkgrel=1
pkgdesc="Programs for working with maps and geodata"
arch=('i686' 'x86_64')
url="http://slazav.mccme.ru/prog/mapsoft.htm"
license=('GPL')
depends=('cairomm' 'curl' 'giflib4' 'gtkmm' 'libjpeg-turbo' 'libpng' 'libtiff' 'libusb' 'libxml2' 'libyaml' 'libzip' 'pixman' 'proj' 'zlib')
makedepends=('boost' 'netpbm' 'perl' 'scons' 'transfig')
source=("https://github.com/ushakov/${pkgname}/archive/${pkgver}-alt1.tar.gz"
        "giflib42.patch")
sha256sums=('9138deccec892d939b860ab7aebd8053eb390989ffb5ce41304be0b9588fdbc1'
            '356d474d362d84f933d1aa7f11f7d13cccb1031c8d578ecc2a601c39dd88f467')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}-alt1
  patch -Np1 <../giflib42.patch
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-alt1
  scons -j1 -Q prefix=${pkgdir} -Q minimal=1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-alt1
  scons -j1 -Q prefix=${pkgdir} install
}
