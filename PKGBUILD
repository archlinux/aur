# Maintainer: Atte Lautanala <atte@lautana.la>
pkgname=phrase-cli
pkgver=2.19.0
pkgrel=1
pkgdesc="Phrase CLI tool"
arch=('i686' 'x86_64')
url="https://phrase.com/cli"
license=('MIT')
makedepends=('go')

source=("https://github.com/phrase/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('f368d03704041d0735cd194d480953b0f2a1c35284b1246c6293d7d0ca1ba81040f72ec85ac28539127e77745ed14fc74540c5ab7fdc008af4c736ea2892499d')

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
