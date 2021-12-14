# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>

pkgname=kepubify
pkgver=4.0.2
pkgrel=1
pkgdesc='Convert your ePubs into kepubs, with a easy-to-use command-line tool'
arch=('x86_64')
url='https://pgaskin.net/kepubify/'
license=('MIT')
conflicts=('kepubify-bin')
makedepends=('go')
source=("https://github.com/pgaskin/kepubify/archive/v$pkgver.tar.gz")
sha256sums=('f6bf7065ec99e48766f60a126590e021f5bd4fac19754ecb2d90eaf106f4e39b')

build() {
  cd "$pkgname-$pkgver"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags $LDFLAGS -X main.version=$pkgver" \
    -o $pkgname \
    github.com/pgaskin/kepubify/v4/cmd/kepubify/

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags $LDFLAGS -X main.version=$pkgver" \
    -o covergen \
    github.com/pgaskin/kepubify/v4/cmd/covergen/

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags $LDFLAGS -X main.version=$pkgver" \
    -o seriesmeta \
    github.com/pgaskin/kepubify/v4/cmd/seriesmeta/
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 kepubify "${pkgdir}/usr/bin/kepubify"
  install -Dm755 covergen "${pkgdir}/usr/bin/covergen"
  install -Dm755 seriesmeta "${pkgdir}/usr/bin/seriesmeta"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
