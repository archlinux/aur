# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
pkgname=mapsoft
pkgver=20190213
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
sha256sums=('49f06f337ad71f63edfacfb06a9bb0d536a991853eea7255373071eed001a171'
            'f6b0c49271c21f44e2f007b3096c0d80e662c0dc9ff8b66e60c82402b1826096'
            '5c1430eda36cc13aba489e2467f01b101872e066c19982ba2accd3f230a56e96')

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
