# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>

pkgname=tango-accesscontrol
_pkgname=TangoAccessControl
pkgver=2.21
_pkgver=${_pkgname}-Release-${pkgver}
pkgrel=2
groups=("tango-controls")
pkgdesc="combined from svn/TangoAccessControl and svn/TangoAccessControl/AbstractClasses"
arch=("x86_64" "armv7h")
url="https://gitlab.com/tango-controls/${_pkgname}"
license=("GPL-3.0-or-later")
depends=("glibc" "gcc-libs" "omniorb" "mariadb-libs" "tango-cpp" "tango-database")
source=(
  "https://gitlab.com/tango-controls/${_pkgname}/-/releases/${_pkgver}/downloads/${_pkgname}-with-submodules-${_pkgver}.tar.gz"
  tango-access.service
)
       
sha256sums=(
  "f318d04ef9d35652b9d74ef0267039f58b7062bef61a42f2c39cd072ec365d0a"
  "883e32ba0309313d0929a329d11b2843c7dee018aa71d4c316779f0888fa4c48"
)

build() {
  cmake -B bld -S "${_pkgname}-with-submodules-${_pkgver}/${_pkgname}" \
  -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build bld
}

package() {
  DESTDIR="${pkgdir}" cmake --install bld
  install -Dm 644 tango-access.service \
  ${pkgdir}/usr/lib/systemd/system/tango-access.service
}
