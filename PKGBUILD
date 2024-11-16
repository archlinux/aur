# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=printfn
_pkgname=hextoggle
pkgname=${_pkgname}-bin
pkgver=1.0.6
pkgrel=1
pkgdesc='Easily view and edit hex files'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-linux-gnu.zip")
sha256sums=('0d7dd92639e4a348dc4109cc18aa9bf47c89dd2dc80baaefde2bf049ea27c4a9'
            '69f6401c4eaabd44d393da2deab424d7a6d08c4fabf374b940fd9fff5deb943d')
sha256sums_x86_64=('4f590604d633e4d724181a3fb016b6f125b8bcb09355e35f04467292174ec115')

build() {
  cd "${srcdir}/" || exit

  chmod +x "${_pkgname}"

  help2man "./${_pkgname}" --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
