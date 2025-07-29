# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgname=qq
pkgname=${_pkgname}-bin
_pkgver=0.3.1
pkgver=${_pkgver}
pkgrel=1
pkgdesc="jq, but with many interoperable configuration format transcodings and interactive querying."
arch=('x86_64' 'aarch64')
url="https://github.com/JFryy/${_pkgname}/"
_urlraw="https://raw.githubusercontent.com/JFryy/${_pkgname}/v${_pkgver}"
license=('MIT')
makedepends=('tar' 'help2man')
provides=("${_pkgname}")
depends=("glibc")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("LICENSE_${pkgver}::${_urlraw}/LICENSE"
        "README_${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}_x86_64.tar.gz::${url}/releases/download/v${_pkgver}/${_pkgname}-v${_pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}_aarch64.tar.gz::${url}/releases/download/v${_pkgver}/${_pkgname}-v${_pkgver}-linux-arm64.tar.gz")
md5sums=('2334c8619b392ef67df716363660a45d'
         'e5b3664c561f5d2b6b5a6c6eddfd6f2f')
md5sums_x86_64=('48033f3423dd82c7f0a1d553e07d5e37')
md5sums_aarch64=('7cadd3d53605445bad115503d8d5e20b')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info

  gzip "MAN-${pkgver}.1"
}

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
