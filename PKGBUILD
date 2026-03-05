# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgname=qq
pkgname=${_pkgname}-bin
pkgver=0.3.4
pkgrel=1
pkgdesc="jq, but with many interoperable configuration format transcodings and interactive querying."
arch=('x86_64' 'aarch64')
url="https://github.com/JFryy/${_pkgname}/"
_urlraw="https://raw.githubusercontent.com/JFryy/${_pkgname}/v${pkgver}"
license=('MIT')
makedepends=('tar' 'help2man')
provides=("${_pkgname}")
depends=("glibc")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("LICENSE_${pkgver}::${_urlraw}/LICENSE"
        "README_${pkgver}::${_urlraw}/README.md")
source_x86_64=("${_pkgname}_${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_pkgname}_${pkgver}_aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
md5sums=('2334c8619b392ef67df716363660a45d'
         'ed1cc6e84a1b2480682086ae93cc37f4')
md5sums_x86_64=('9478cca29cc9655eceb9e65feb555a95')
md5sums_aarch64=('17f9796d5f51b4ee0afa054c2e730ec5')

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
