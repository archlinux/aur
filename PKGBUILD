# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="cu"
pkgname="nedko-${_name}"
_commit="1405d36f0b6e3abfa4deda3253a84e4662d3dc1a" # r17
pkgver="r17+g${_commit::7}"
pkgrel=1
pkgdesc="Port of OpenBSD cu(1) to Linux"
arch=('x86_64')
url="https://github.com/nedko/${_name}"
license=('MIT')
depends=('glibc' 'libbsd' 'libevent')
provides=("${_name}")
conflicts=("${_name}")
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('af38b74ece683b135359988797b1852e77caef4229221835df98caba60adb324')

build() {
  cd "${srcdir}/${_pkgsrc}"
  gcc ${CFLAGS} ${LDFLAGS} -o "${_name}" ./*.c -D_GNU_SOURCE $(pkg-config --cflags --libs libbsd-overlay libevent)
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "${_name}"   "${pkgdir}/usr/bin/${_name}"
  install -vDm644 "README"     "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "${_name}.1" "${pkgdir}/usr/share/man/man1/${_name}.1"
}
