# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=clux
_pkgname=lq
pkgname=${_pkgname}-bin
pkgver=0.12.2
pkgrel=1
pkgdesc="jq compatible yq implementation in rust"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('Apache')
depends=('glibc')
conflicts=("${_pkgname}" "whyq" "whyq-bin")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.xz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-gnu.tar.xz")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '8dbfe3e2ca4c9ce47700e15473d6c4129db56d297b595a38b03f398ce3c8f6f1')
sha256sums_x86_64=('e174c973a1d713159bfa0e14d7f82d0149499b90bc3ddeda65862ff35ffb7de1')
sha256sums_aarch64=('a342b31d9bce4e42b00475e11ad89076fb0645d298357e4a3f8996bd39a15a7c')

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
