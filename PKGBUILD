# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=clux
_pkgname=lq
pkgname=${_pkgname}-bin
pkgver=0.16.0
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
            'ef5f3243dda2aedf8aa0afc2bd8c907dc48cb1cb3969a09e3997679e4cbe1a72')
sha256sums_x86_64=('9534680deab111fc0d5ee109501c729b0cbe13af709845911769ace50eb26de0')
sha256sums_aarch64=('dac001865ae5a83864320eb1831b9bdad7f669bf0ee51b0091f72b426f051678')

prepare() {
  cd "${srcdir}/" || exit

  mv "./${_pkgname}-${CARCH}-unknown-linux-gnu/${_pkgname}" ./${_pkgname}
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
