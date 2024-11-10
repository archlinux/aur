# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=blacknon
_pkgname=snipt
pkgname=${_pkgname}-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='Multiple remote platform snippet-code manager command'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('help2man' 'gzip')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c807ce8088057e72150cb5d6e61c6476d5d074a3d36afff632233384a7c7c7e2')
sha256sums_x86_64=('7b610eb6fe227105351d72aedf0411133c79c6c857a7cef281838a90dfc7ba87')

prepare() {
  cd "${srcdir}/" || exit

  mkdir -p man
}

build() {
  cd "${srcdir}/" || exit

  help2man ./bin/${_pkgname} --output "./man/${_pkgname}.1" --no-info
  gzip "./man/${_pkgname}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "./bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "./man/${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
