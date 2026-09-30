# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ethq'
pkgver='0.7.0'
_gitver='0_7_0'
pkgrel='2'
pkgdesc='Ethernet NIC Queue stats viewer'
arch=('x86_64' 'aarch64')
_uri="github.com/isc-projects/${pkgname}"
url="https://${_uri}"
license=('MPL')
depends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/tar.gz/refs/tags/v${_gitver}")
sha256sums=('6e40d98d32abbe0915a7a8996edcdbae61a54bb1f34f2f8a5c9c8d3d2962ec23')

prepare() {
  # Remove hardcoded flags
  sed --in-place \
    --expression '/= -s/d' \
    --expression '/= -O3/d' \
  "${pkgname}-${_gitver}/Makefile"
}

build() {
  cd "${pkgname}-${_gitver}"
  CFLAGS="${CFLAGS} ${DEBUG_CFLAGS}" \
  CXXLAGS="${CXXFLAGS} ${DEBUG_CXXFLAGS}" \
  LDFLAGS="${LDFLAGS}" \
  make
}

package() {
  cd "${pkgname}-${_gitver}"
  install -Dm0755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
