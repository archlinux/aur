# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=clux
_pkgname=lq
pkgname=${_pkgname}-bin
pkgver=0.13.0
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
            '39087db95275a1e0b8df76656bfdb0fd349b60aae4cca8e3476957426fe52d9a')
sha256sums_x86_64=('45f7cb8651e8cfbca87b34b7f6775a5c7a3ddaafe7bd7e564a621fbad35b9d77')
sha256sums_aarch64=('df2142277ac8847e16e8ac0ccb8c3ea9744bbd9b5f8e1e86a0e7616188367bdb')

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
