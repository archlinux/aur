# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='floatybox'
pkgver=0.1.0
pkgrel=1
pkgdesc='Float your way through perilous terrain in this endless side-scoller game'
arch=('x86_64')
url='https://octobanana.com/software/floatybox'
_url_source='https://github.com/octobanana/floatybox'
license=('MIT')
depends=('boost-libs')
makedepends=('boost' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::${_url_source}/archive/${pkgver}.tar.gz")
sha256sums=('1949018c82ab3a5ee66c474c850614133f52c134ed04aa133d4841d46ccc4718')

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
