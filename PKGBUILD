# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=trdsql
pkgver=0.7.4
pkgrel=1
pkgdesc="Tool that can execute SQL queries on CSV, LTSV and JSON"
arch=('i686' 'x86_64')
url="https://github.com/noborus/trdsql"
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('f3bf3dd0106d459c03c59b42cff0f4acab35708aa250ca5b034631da30cf4b49')


build() {
  cd "$pkgname-$pkgver"
  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

#check() {
#  cd "$pkgname-$pkgver"
#  go test -mod=vendor ./...
#}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 trdsql "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 completion/trdsql-completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
