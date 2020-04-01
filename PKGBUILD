# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>

pkgname=kepubify
pkgver=3.1.1
pkgrel=2
pkgdesc='Convert your ePubs into kepubs, with a easy-to-use command-line tool'
arch=('x86_64')
url='https://geek1011.github.io/kepubify'
license=('MIT')
conflicts=('kepubify-bin')
source=("https://github.com/geek1011/kepubify/archive/v$pkgver.tar.gz")
sha256sums=('500f8711cb8e9023d3e6534e0ff769ebfb8d05377e9d8f6ae20cad74e903c753')

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
