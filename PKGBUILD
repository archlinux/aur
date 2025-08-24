# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=lhvy
_pkgname=pipes-rs
pkgname=${_pkgname}-bin
pkgver=1.6.4
pkgrel=1
pkgdesc="An over-engineered rewrite of pipes.sh in Rust"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=("x86_64")
license=("MIT")
depends=("glibc")
makedepends=("help2man")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${arch[0]}.tar.gz")
sha256sums=("2c7c5d22ed5a8ee968c64757710979afcd77438c48b4a265b94e615babd8a901"
            "d8c6b16acf66ee20d8716e0b7962d1a2d4e4ea85a3df458015972ecd3368ec9e")
sha256sums_x86_64=("5a91499b7632e95001ea38bcd7afbfadff60a118cbe7edd6f0d260fa5bf619eb")

build() {
  cd "${srcdir}/" || exit

  help2man "target/${CARCH}-unknown-linux-gnu/release/${_pkgname}" --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "target/${CARCH}-unknown-linux-gnu/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
