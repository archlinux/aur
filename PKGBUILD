# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=mapsoft
pkgver=20191201
pkgrel=1
pkgdesc='Programs for working with maps and geodata'
arch=(x86_64)
url='http://slazav.mccme.ru/prog/mapsoft.htm'
license=('GPL3')
depends=('curl' 'giflib' 'gtkmm' 'libjpeg-turbo' 'libtiff' 'libusb' 'libxml2' 'libyaml' 'libzip' 'proj' 'shapelib' 'imagemagick'
         'perl' 'perl-text-iconv')
makedepends=('boost' 'netpbm' 'scons' 'transfig')
source=("https://github.com/ushakov/${pkgname}/archive/${pkgver}-alt1.tar.gz"
        'scons.patch')
sha256sums=('14d625b2b1cabd76fa7e0d21ff7c114db1f110d405bc22572deead8a21e49fe0'
            '4333c15035c8aa3f17ab5f1c7f34d4e728836be08320079d9dbbd2844f13c627')

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
