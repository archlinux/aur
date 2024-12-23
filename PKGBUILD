# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sibprogrammer
_pkgname=xq
pkgname=${_pkgname}-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Command-line XML and HTML beautifier and content extractor'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}" 'yq')
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('394421490c78d4bdc96539abe41466a3d5716dc1a624e6a531b886756edba64d'
            'fcac2bef46c99cdb98d416a81210290da0245dbdf5ce764951051c627cd873e1')
sha256sums_x86_64=('8328bf901a44c2e7fb13c06ab7987ab8a0057e5bc55c4ff9a4ea0d83ec52e417')
sha256sums_i686=('19cfd638f99fd811b994a29fbb487f8f44a638d0874af75e3b0df73b578a8bdd')
sha256sums_aarch64=('264928277ca1b77f93e778b2e62c5b6bb8bf573f6c11f0466e7c565184f61dd0')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
