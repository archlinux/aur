# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='octavia'
pkgver=0.1.2
pkgrel=1
pkgdesc="octobanana's customizable text-based audio visualization interactive application"
arch=('x86_64')
url='https://octobanana.com/software/octavia'
_url_source='https://github.com/octobanana/octavia'
license=('MIT')
depends=('boost-libs' 'sfml')
makedepends=('boost' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::${_url_source}/archive/${pkgver}.tar.gz")
sha256sums=('abc0717312178e24780081418ee7d7578ac3b721bce7fd307853688eb4cd1674')

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
