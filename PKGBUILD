# Maintainer: Atte Lautanala <atte@lautana.la>
pkgname=phrase-cli
pkgver=2.21.0
pkgrel=1
pkgdesc="Phrase CLI tool"
arch=('i686' 'x86_64')
url="https://phrase.com/cli"
license=('MIT')
makedepends=('go')

source=("https://github.com/phrase/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('ddc24877d5a82ffa17a7f590bc85a70b6cf9ae1b15c0e9646b72d7a8f49770974dcc3f9688e74d5f722c13951821738f45c04f37707d6036d6f74b5e6ee82afd')

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
