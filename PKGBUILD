# Maintainer:  WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Ian Thompson <dalrik370 at gmail dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: TheBenj88 <thebenj88 *AT* gmail *DOT* com>

pkgname=openxcom
pkgver=1.0
pkgrel=8
pkgdesc="An open-source reimplementation of the famous X-COM game"
arch=('i686' 'x86_64')
url="https://openxcom.org/"
license=('GPL3')
depends=('sdl_gfx' 'sdl_mixer' 'sdl_image' 'yaml-cpp' 'mesa')
makedepends=('boost' 'glu' 'xmlto' 'docbook-xml' 'docbook-xsl' 'xorgproto')
optdepends=('openxcom-data-steam: Original XCom data files from steam')
install="${pkgname}.install"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/SupSuper/OpenXcom/archive/v1.0.tar.gz"
        "openxcom-abs-fix.patch"
        "openxcom-auto_ptr-fix.patch"
        "openxcom-cmath-algorithm-fixes.patch")
sha256sums=('45acb280010a01d60506b1c5f2951ae501c012cc6161aac470bd15c1e6981246'
            'd80c75b8fe3b5404a10f550f66307abfabc6bec5ed88b417f36222293ccda06c'
            '40b52c623a71fa8986296e8e6c3c775fe4751fe1846722ef1442bd171ac31a8b'
            '3b285e666fc3d37486861b3a17ff156d9b8804167403c58a267bdb69e55c8b86')

prepare() {
  cd OpenXcom-${pkgver}
  patch -Np1 -i "${srcdir}/openxcom-abs-fix.patch"
  patch -Np1 -i "${srcdir}/openxcom-auto_ptr-fix.patch"
  patch -Np1 -i "${srcdir}/openxcom-cmath-algorithm-fixes.patch"
}

build() {
  cd OpenXcom-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr --without-docs --disable-werror
  make
}

package() {
  cd OpenXcom-${pkgver}
  make DESTDIR="${pkgdir}" install
}
