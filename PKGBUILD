# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Edgar Fournival <contact at edgar-fournival dot fr>

pkgauthor=shenwei356
pkgname=brename
pkgver=2.15.0
pkgrel=1
pkgdesc='A practical cross-platform command-line tool for safely batch renaming files/directories via regular expression'

url="https://github.com/${pkgauthor}/${pkgname}"
_urlraw="https://raw.githubusercontent.com/${pkgauthor}/${pkgname}/v${pkgver}"

arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

provides=("${pkgname}")
makedepends=('go')

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ad957eea95c7b1f8283a08c46f7128e0f944d29e139bf63557da17f1906b47df')

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
