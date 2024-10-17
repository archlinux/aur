# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=clux
_pkgname=whyq
pkgname=${_pkgname}-bin
pkgver=0.10.2
pkgrel=1
pkgdesc="jq compatible yq implementation in rust"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('Apache')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname//wh/}-${arch[0]}-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname//wh/}-${arch[1]}-unknown-linux-gnu.tar.xz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '290026aeaffa6fb4da9dce409a4a0d37cebb77d9c0f7440dd84cd30898ea7fab')
sha256sums_x86_64=('62ac3fe3e1c4e8e62de2c3ce8f68339ac85587f8b239dc7731e1e85271f2997d')
sha256sums_aarch64=('62a87fc1a1ec5e7a1cd870eec667fce0225cb2737b9a2edc0df223886a8ae007')

prepare() {
  cd "${srcdir}/" || exit

  mv "./${_pkgname//wh/}-${CARCH}-unknown-linux-gnu/${_pkgname//wh/}" ./${_pkgname}
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
