# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

_pkgauthor=sigoden
_pkgname=projclean
pkgname=${_pkgname}-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Project dependencies & build artifacts cleanup tool."
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT' 'Apache-2.0')
depends=('curl' 'tar' 'gzip' 'unzip')
makedepends=('help2man')

source=("README_${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-MIT_${pkgver}::${_urlraw}/LICENSE-MIT"
        "LICENSE-APACHE_${pkgver}::${_urlraw}/LICENSE-APACHE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")

sha256sums=('ef198f77bf6a2dbded09138c9b630a49e7da1bf5650ca3c7bbbe5588c3989ca6'
            '58b9882a15bfb5d12c6829b8376bc2b2e5dda05ce8e78c43b43f1c6213b53926'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('36cd9e822dd9e3018e630f93ccc0ba08924af9ec0b64114f5c6cb9f0482b41b1')
sha256sums_i686=('36cd9e822dd9e3018e630f93ccc0ba08924af9ec0b64114f5c6cb9f0482b41b1')
sha256sums_aarch64=('36cd9e822dd9e3018e630f93ccc0ba08924af9ec0b64114f5c6cb9f0482b41b1')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info --no-discard-stderr

  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README_${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-MIT_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE_${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
