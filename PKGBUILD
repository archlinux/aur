# Maintainer: Atte Lautanala <atte@lautana.la>
pkgname=phrase-cli
pkgver=2.19.1
pkgrel=1
pkgdesc="Phrase CLI tool"
arch=('i686' 'x86_64')
url="https://phrase.com/cli"
license=('MIT')
makedepends=('go')

source=("https://github.com/phrase/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('cfdb13768f6f08fea7255e3ac3124376065eeb88cbb1f0ce121b0378047766cd026001f9c9ed58de142e7764790648995f5a258769e1474f7dc6c924534e1835')

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
