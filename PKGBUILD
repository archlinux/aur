# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=trdsql
pkgver=0.4.0
pkgrel=1
pkgdesc="Tool that can execute SQL queries on CSV, LTSV and JSON"
arch=('i686' 'x86_64')
url="https://github.com/noborus/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go' 'dep')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9d9afb41b4344cb23979cc58620142a41be0ca28c014346ce6d0b797cf6671e5')

prepare() {
  mkdir -p "${srcdir}/src/github.com/noborus"
  mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/github.com/noborus/${pkgname}"
}

build() {
  cd "${srcdir}/src/github.com/noborus/${pkgname}"
  export GOPATH="${srcdir}"
  dep ensure
  go build -o ${pkgname}
}

# check() {
#   cd "${srcdir}/src/github.com/noborus/${pkgname}"
#   export GOPATH="${srcdir}"
#   go test ./...
# }

package() {
  cd "${srcdir}/src/github.com/noborus/${pkgname}"
  install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 completion/trdsql-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
