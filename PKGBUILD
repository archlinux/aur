# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sachaos
_pkgname=viddy
pkgname=${_pkgname}-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='A modern watch command. Time machine and pager.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i686' 'arm64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[0]}.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[1]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${_barch[2]}.tar.gz")
sha256sums=('e6eea22d4e9e0aa6a78d0f9126009ec041ea047f94b320c003c34a631821f953'
            'c12028a4ce7dbff64f8467eda2d4a9650bebfc4618198720de5f821e9d9b8cc3')
sha256sums_x86_64=('c0406da6c19bbfbf0381a1a54cf7098a97372c15e5d64bed38e4b8be53e8455e')
sha256sums_i686=('a2cdb3d46d03cff996cd4e23223d2a005b5ba701192d3fd2fcd3652c3558d0d3')
sha256sums_aarch64=('4bf88aa5443b09a49e8af55c1e92ff6148486856703b8f886e1984b0e541af4d')

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
