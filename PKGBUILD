# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='gentone'
pkgver=0.1.2
pkgrel=1
pkgdesc='Generate a tone from a note or frequency'
arch=('x86_64')
url='https://octobanana.com/software/gentone'
_url_source='https://github.com/octobanana/gentone'
license=('MIT')
depends=('sfml')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${_url_source}/archive/${pkgver}.tar.gz")
sha256sums=('c215602b40f8a3149aef57110317c615e50faf1f68867e79c262e6d6aa5c5392')

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
  install -Dvm755 "build/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgname}-${pkgver}/"{'README.md','doc/help.txt'} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
