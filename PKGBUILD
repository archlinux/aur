# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini@gmail.com>

_pkgauthor=sigoden
_pkgname=upt
pkgname=${_pkgname}-bin
pkgver=0.9.0
pkgrel=2
pkgdesc="Universal Package-management Tool for any OS."
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT' 'Apache')
depends=('curl' 'tar' 'gzip' 'unzip')
makedepends=('help2man')

source=("README_${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-MIT_${pkgver}::${_urlraw}/LICENSE-MIT"
        "LICENSE-APACHE_${pkgver}::${_urlraw}/LICENSE-APACHE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")

sha256sums=('a669d78e312f9cebf5425d3b79ac314aad2e0d5c8a3cfe5b6b5705c6f59e7047'
            '5af431a6a9869052e2be4e71ccd731c7efe45dca47eaca84d4d1fb38f134cb79'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('3051a30e23a2c5167bdd48d98fea2bf8fedec328bf2f570b3c4d42fdb92a674e')
sha256sums_i686=('3051a30e23a2c5167bdd48d98fea2bf8fedec328bf2f570b3c4d42fdb92a674e')
sha256sums_aarch64=('3051a30e23a2c5167bdd48d98fea2bf8fedec328bf2f570b3c4d42fdb92a674e')

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
