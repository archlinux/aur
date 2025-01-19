# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ankddev
_pkgname=envfetch
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Lightweight CLI tool for working with environment variables'
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
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver//./-}-linux")
sha256sums=('6cfc9cc9f1c7644dba9345bbb0388cc683a9e31684cb7f86d0f8965d681ec90c'
            'e2b2572087bd3426ead0dcb2f21d04fcf10b9720013bccc8fb932db9a715d1b5')
sha256sums_x86_64=('481832cc1b11fd3f34291d238b7b6ef25bb6dcd2a264236e8123873b5420f93b')

prepare() {
  cd "${srcdir}/" || exit

  chmod +x ./${_pkgname}-${pkgver}
}

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname}-${pkgver} --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
