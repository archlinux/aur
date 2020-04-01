# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>

pkgname=kepubify
pkgver=3.1.2
pkgrel=1
pkgdesc='Convert your ePubs into kepubs, with a easy-to-use command-line tool'
arch=('x86_64')
url='https://geek1011.github.io/kepubify'
license=('MIT')
conflicts=('kepubify-bin')
source=("https://github.com/geek1011/kepubify/archive/v$pkgver.tar.gz")
sha256sums=('69f02af0846eb5c153db73a1c07b53ba478986ca07f87af400d66e5f47699f81')

build() {
  cd "$pkgname-$pkgver"

  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS -X main.version=$pkgver" \
    -o $pkgname \
    github.com/geek1011/kepubify/v3/cmd/kepubify/

  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS -X main.version=$pkgver" \
    -o covergen \
    github.com/geek1011/kepubify/v3/cmd/covergen/

  go build \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS -X main.version=$pkgver" \
    -o seriesmeta \
    github.com/geek1011/kepubify/v3/cmd/seriesmeta/
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 kepubify "${pkgdir}/usr/bin/kepubify"
  install -Dm755 covergen "${pkgdir}/usr/bin/covergen"
  install -Dm755 seriesmeta "${pkgdir}/usr/bin/seriesmeta"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
