# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=trdsql
pkgver=0.4.0
pkgrel=1
pkgdesc="Tool that can execute SQL queries on CSV, LTSV and JSON"
arch=('i686' 'x86_64')
url="https://github.com/noborus/trdsql"
license=('MIT')
depends=('glibc')
makedepends=('go' 'dep')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9d9afb41b4344cb23979cc58620142a41be0ca28c014346ce6d0b797cf6671e5')

prepare() {
  mkdir -p src/github.com/noborus
  mv ${pkgname}-${pkgver} src/github.com/noborus/trdsql
}

build() {
  cd src/github.com/noborus/trdsql
  GOPATH="${srcdir}"
  dep ensure
  go build
}

# check() {
#   cd src/github.com/noborus/trdsql
#   env GOPATH="${srcdir}" go test ./...
# }

package() {
  cd src/github.com/noborus/trdsql
  install -Dm755 trdsql "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 completion/trdsql-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
