# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=horizontal-rule
_pkgname=hr
pkgver=0.5.0
pkgrel=2
pkgdesc='A horizontal rule for the terminal'
arch=('x86_64')
url='https://octobanana.com/software/hr'
license=('MIT')
makedepends=('cmake')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/octobanana/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('18b499b7886acdd3099768e1789c4d5f73195976df65bbf1e201a995f491a9bd')

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "${_pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C build install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}-${pkgver}/README.md"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" "${_pkgname}-${pkgver}/LICENSE"
}

# vim: ts=2 sw=2 et:
