# Maintainer: Atte Lautanala <atte@lautana.la>
pkgname=phrase-cli
pkgver=2.13.0
pkgrel=1
pkgdesc="Phrase CLI tool"
arch=('i686' 'x86_64')
url="https://phrase.com/cli"
license=('MIT')
makedepends=('go')

source=("$pkgname-$pkgver.tar.gz::https://github.com/phrase/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b870686b5e2ce6f670bf419f053cec729615f424cfdee1124ba9e8de26c32c87')

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
