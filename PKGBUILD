# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=fioncat
_pkgname=otree
pkgname=${_pkgname}-bin
pkgver=0.7.1
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
            'df26111575d4f132457aefc83b47610896e3d49e1174eb18e21eb7cdd51b6081'
            '398576fd045122a0bb945d2549a7c44fb6785bc455b432568211b0b8ce01b1bb')
sha256sums_x86_64=('a46dd82f81df6dc7bf321e52b804d42ae6027824acfb83a142c17be4a73ac7fc')
sha256sums_aarch64=('4c95edc8cb28e64dede037c06ed9ef9bcd434d666d3ec265b319a1093dd1572b')


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
