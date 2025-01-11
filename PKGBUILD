# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=RubixDev
_pkgname=pixfetch
pkgname=${_pkgname}-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Another fetch program with pixelized images written in Rust'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('GPL2')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch[1]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch[2]}-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('6237818a4d9ddc29be67a21084290cdf865e443c6988d9030238dfe9e087ac00')
sha256sums_i686=('847e204f68c661a455817e96c2127e48919f2d7e0b4a72f1c5c584983af11da0')
sha256sums_aarch64=('18d959c5046a1a148d38a276ff956f98d8c0896f9b618567e0ff715bfe457f8f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-musl/" || exit

  help2man ./${_pkgname} --output "MAN.1" --no-info
  gzip "MAN.1"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-musl/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "doc/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

  install -Dm644 "completion/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "completion/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "completion/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
