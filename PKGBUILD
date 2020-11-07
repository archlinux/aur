# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='chkservice'
pkgver=0.3
pkgrel=2
pkgdesc='Systemd units manager with ncurses terminal interface'
arch=('x86_64')
url='https://github.com/linuxenko/chkservice'
license=('GPL3')
depends=('libsystemd')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('56037fd82be06d6115d0738439c23faa291d036ffe33fe590b484b045d6d180d')

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B 'build' -S "${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C 'build'
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
