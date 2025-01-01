# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Edgar Fournival <contact at edgar-fournival dot fr>

_pkgauthor=shenwei356
pkgname=brename
pkgver=2.14.0
pkgrel=1
pkgdesc='A practical cross-platform command-line tool for safely batch renaming files/directories via regular expression'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

provides=("${pkgname}")
makedepends=('go')

source=("https://github.com/${_pkgauthor}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a16bceb25a75afa14c5dae2248c1244f1083b80b62783ce5dbf3e46ff68867d5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit

  GOPATH="${srcdir}" CGO_ENABLED=0 go build -tags netgo -ldflags '-w -s'
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
