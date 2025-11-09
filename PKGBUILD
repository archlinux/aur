# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=VladimirMarkelov
_pkgname=ttdl
pkgname=${_pkgname}-bin
pkgver=4.13.0
pkgrel=1
pkgdesc='TTDL - Terminal Todo List Manager. A CLI tool to manage todo lists in todo.txt format.'
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
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux-x64-musl.tar.gz")

sha256sums=('234f3f9b9f2d3d402a89072e424f4d69625d831ce858d7cdd5c4e57169b96211'
            '524ea4591f41c3dbb76e5675907337852d592838d91db4dc29ebfa71b2cb04d6')
sha256sums_x86_64=('65d6ed38074f59a5ced9b2f6bad7dd1c25625cd7ee7884c69a7b3db65d2f8607')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
