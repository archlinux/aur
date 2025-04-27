# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=clux
_pkgname=lq
pkgname=${_pkgname}-bin
pkgver=0.14.0
pkgrel=1
pkgdesc="jq compatible yq/tq implementation in rust"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}" "whyq" "whyq-bin")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-gnu.tar.xz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '9e7cbb159f5efe11d103e232472fbcb6929012a60da4e3901004828dfad6d302')
sha256sums_x86_64=('1b5eaa884b8613103e841308980abf91f122cf128bebe5b9748449d285bfe059')
sha256sums_aarch64=('2df9170072d171c97ffa4b3f88096c008a2cdf5ec9ce6251dcb8e6c3c4da1062')

prepare() {
  cd "${srcdir}/" || exit

  mv "./${_pkgname}-${CARCH}-unknown-linux-gnu/${_pkgname}" ./${_pkgname}
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
