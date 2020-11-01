# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='neix'
pkgver=0.1.3
pkgrel=1
pkgdesc='RSS/Atom feed reader for your terminal'
arch=('x86_64')
url='https://github.com/tomschwarz/neix'
license=('GPL3')
depends=('ncurses')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('56515164cec7ec51fff4181f7b5e95ada80dab493305c7cf192e8b4aae924f41')

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
