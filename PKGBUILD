# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=mifi
_pkgname=ezshare
pkgname=${_pkgname}-bin
pkgver=1.11.3
pkgrel=1
pkgdesc='Easily share files, folders and clipboard over LAN - Like Google Drive but without internet'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=(!strip)
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux.zip")
sha256sums=('45f0b58ab7c3ea2b8f2be6e31656d4327a5e35d5116ff8e92457c7d672c92321'
            '974a86f0ecc41b3d4c75690907797a891e9f646d26268594f1d0fa528ec4fec1')
sha256sums_x86_64=('fcf121869534f393be8b3cbb2f83a741c1f9d5613b2a3ec4f54818d9551b8f17')

build() {
  cd "${srcdir}/" || exit

  help2man ${_pkgname}/${_pkgname} --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgname}/clipboard" "${pkgdir}/usr/bin/clipboard"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
