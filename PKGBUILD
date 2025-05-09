# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=clux
_pkgname=lq
pkgname=${_pkgname}-bin
pkgver=0.15.0
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
            '4b5b302a49045cf1bcc56d61ae41feb2ca3587db823ce7eaa6cec729e0be4727')
sha256sums_x86_64=('ee382eb1940844a7e2a3c2b725abe78de98db01a651781eb71270a35d16688fe')
sha256sums_aarch64=('c92e5739e868d9a60cba848144377286594bf601d0fc59ef6f29e88642940538')

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
