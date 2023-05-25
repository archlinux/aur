# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=tango-accesscontrol
_pkgname=TangoAccessControl
pkgver=2.19
_pkgver=${_pkgname}-Release-${pkgver}
pkgrel=1
groups=('tango-controls')
pkgdesc="combined from svn/TangoAccessControl and svn/TangoAccessControl/AbstractClasses"
arch=('x86_64')
url="https://gitlab.com/tango-controls/TangoAccessControl"
license=('GPL3')
depends=('tango-cpp' 'tango-database')
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/archive/${_pkgver}/${_pkgname}-${_pkgver}.tar.gz"
  tango-access.service
)
       
sha256sums=(
  'd507194f67fc8b7cf06b89d0117937c3e82ff733d952b5f192581eb3f55155ee'
  '883e32ba0309313d0929a329d11b2843c7dee018aa71d4c316779f0888fa4c48'
)

build() {
  cmake -B bld -S "${_pkgname}-${_pkgver}/${_pkgname}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build bld
}

package() {
  DESTDIR="${pkgdir}" cmake --install bld
  install -Dm 644 tango-access.service ${pkgdir}/usr/lib/systemd/system/tango-access.service
}
