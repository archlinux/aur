# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=fioncat
_pkgname=otree
pkgname=${_pkgname}-bin
pkgver=0.5.2
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
            '2b03bb5d5ac5b166bd821899397c2a0a35a1b93a6d289886f940a9a71448be02'
            '2bbe243e7105e8cec3bfada94ec4aa098902f8ebe8352198157c683bbd3d9d13'
            '97087fb069083b49d09b16fed9ccda9205dd12e7f5575735a42b2a8229e66d07')
sha256sums_x86_64=('9ad8b1e6b63f9dd76b2ef7ead5d112a2595419bf84a20a188929b4acd9e707ff')
sha256sums_aarch64=('51491818a69358f99cebd347171e119dbf183a8e0041216e79f0ab785d3ad5b2')


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
