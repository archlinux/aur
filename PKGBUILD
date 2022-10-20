# Maintainer: Atte Lautanala <atte.lautanala@gmail.com>
pkgname=phrase-cli
pkgver=2.5.3
pkgrel=1
pkgdesc="Phrase CLI tool"
arch=('i686' 'x86_64')
url="https://phrase.com/cli"
license=('MIT')
makedepends=('go')

source=("https://github.com/phrase/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('32cfe9e6f60571bb740e7620e8d44d336cfd6fc37d84afbbc287a6e0be78867f')

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
