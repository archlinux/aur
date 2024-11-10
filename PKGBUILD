# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=shiro
_pkgname=map2-legacy
_execname=${_pkgname%-legacy}
pkgname=${_pkgname%-legacy}-bin
pkgver=1.0.6
pkgrel=2
pkgdesc='A scripting language that allows complex key remapping on Linux, written in Rust'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_execname}" "${_execname}-git")
provides=("${_execname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname%-legacy}-${pkgver}-x86_64.tar.gz")
sha256sums=('62525786082570843135ff2755a66cffda51a0c6d8522f8364754520e4e4d86c'
            '851a708dccf5491c69af8c74ea7302b38043608410ae2be1954efea7c1408c71')
sha256sums_x86_64=('ba7841c557b512f64845cd695089b08e3e67acde34c8827b4f64874c6a4c2010')

build() {
  cd "${srcdir}/" || exit

  help2man ./usr/bin/${_execname} --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "./usr/bin/${_execname}" "${pkgdir}/usr/bin/${_execname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_execname}.1.gz"
}
