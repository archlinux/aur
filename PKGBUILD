# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="mooshika"
pkgver=1.1
pkgrel=1
pkgdesc="RDMA abstraction layer"
arch=('x86_64')
url="https://github.com/martinetd/${pkgname}"
license=('LGPL-3.0-only')
depends=('glibc' 'libpcap' 'rdma-core')
provides=("lib${pkgname}.so")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('e58a9811a67d030df15cadd9da8c916c54b0eddef305f195c992f85e5bed28d4833559432e5203933c51c743e979d247a6dcc99fc9da190dab00b1d9a47d57a9')

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr'
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
