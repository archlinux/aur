# Maintainer: Atte Lautanala <atte.lautanala@gmail.com>
pkgname=phrase-cli
pkgver=2.6.4
pkgrel=1
pkgdesc="Phrase CLI tool"
arch=('i686' 'x86_64')
url="https://phrase.com/cli"
license=('MIT')
makedepends=('go')

source=("https://github.com/phrase/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e2e12c293dacc3fc9cd73df8dfb5d7b3adcd5bae2cf3b6c993ae3e72d7aed4af')

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
