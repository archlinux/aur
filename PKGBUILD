# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=trdsql
pkgver=0.4.1
pkgrel=1
pkgdesc="Tool that can execute SQL queries on CSV, LTSV and JSON"
arch=('i686' 'x86_64')
url="https://github.com/noborus/trdsql"
license=('MIT')
depends=('glibc')
makedepends=('go' 'dep')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('17aab53f4384824ea9a386f240a20b770bbbdb8c521383558febc998fad966ef')

prepare() {
  mkdir -p src/github.com/noborus
  mv ${pkgname}-${pkgver} src/github.com/noborus/trdsql
  cd src/github.com/noborus/trdsql
  env GOPATH="${srcdir}" dep ensure
}

build() {
  cd src/github.com/noborus/trdsql
  env GOPATH="${srcdir}" go build
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
