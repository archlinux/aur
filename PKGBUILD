# Maintainer: Atte Lautanala <atte@lautana.la>
pkgname=phrase-cli
pkgver=2.12.0
pkgrel=1
pkgdesc="Phrase CLI tool"
arch=('i686' 'x86_64')
url="https://phrase.com/cli"
license=('MIT')
makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/phrase/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d97760500a4dd53629d320daec4275ae7272d3f013e08151265e4ec4dd8c3b5e')

build() {
  cd "${pkgname}-${pkgver}"
  export GOFLAGS="-buildmode=pie"
  export CGO_ENABLED=0
  _LDFLAGS="-X github.com/phrase/phrase-cli/cmd.PHRASE_CLIENT_VERSION=${pkgver} -extldflags ${LDFLAGS}"
  go build -o phrase -ldflags "${_LDFLAGS}"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/phrase" "$pkgdir/usr/bin/phrase"
}
