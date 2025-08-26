# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=fioncat
_pkgname=otree
pkgname=${_pkgname}-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="Object Tree TUI Viewer"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
depends=('glibc')
makedepends=('help2man')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "ACTIONS-${pkgver}.md::${_urlraw}/docs/actions.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/docs/changelog.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('c7dc85e2deab624457e3f411dd0e6eb9531611c4a11e3028c38e02999f27d94d'
            'e5eb45bb8901986913143f97134d7e37d22fe687c795c8fc2052198b379bb382'
            'caa97cc0b15908af44774ea358ce12aeef822d5c30c1f81b4c7da57313c8ee71'
            '4d15ef4c001d5bf2bf3af034820da6b448b018d9eb0ce3b8dedb5dee1b620f9b')
sha256sums_x86_64=('9bf5e2b7aa0afe6a64e17cb8522571eda326931b3106651840a8f492c523dc49')
sha256sums_aarch64=('db02a901086d1d856e5eb63d08ba0753278dd60941dc816175f098bf8ff6a101')


build() {
  cd "${srcdir}/" || exit

  help2man "./${_pkgname}" --output "MAN-${pkgver}.1" --no-info

  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "ACTIONS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ACTIONS.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
