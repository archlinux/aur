# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dalance
_pkgname=pipecolor
pkgname=${_pkgname}-bin
pkgver=0.4.4
pkgrel=1
pkgdesc='A terminal filter to colorize output'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-lnx.zip")
sha256sums=('83e4dd21429a91fb7cea67a476032a9641425e5355df2e0f589a738b6ec9fd2c'
            'c5f1bff3048c0dd0fb7a5216d2af73e09624f6594c9169deccd9e1b3f63086cd')
sha256sums_x86_64=('5d078e207faef359a255d9580942c32ca1b225a22353fa0bb7cbb7bcb55acd95')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
