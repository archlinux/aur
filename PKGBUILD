# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>

pkgname=kepubify
pkgver=3.1.4
pkgrel=1
pkgdesc='Convert your ePubs into kepubs, with a easy-to-use command-line tool'
arch=('x86_64')
url='https://pgaskin.net/kepubify/'
license=('MIT')
conflicts=('kepubify-bin')
makedepends=('go')
source=("https://github.com/pgaskin/kepubify/archive/v$pkgver.tar.gz")
sha256sums=('52e2099ed130d85d828d11c9addaf8099d6b84c53a477caa2fce77954ab043c4')

build() {
  cd "$pkgname-$pkgver"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags $LDFLAGS -X main.version=$pkgver" \
    -o $pkgname \
    github.com/pgaskin/kepubify/v3/cmd/kepubify/

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags $LDFLAGS -X main.version=$pkgver" \
    -o covergen \
    github.com/pgaskin/kepubify/v3/cmd/covergen/

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-extldflags $LDFLAGS -X main.version=$pkgver" \
    -o seriesmeta \
    github.com/pgaskin/kepubify/v3/cmd/seriesmeta/
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 kepubify "${pkgdir}/usr/bin/kepubify"
  install -Dm755 covergen "${pkgdir}/usr/bin/covergen"
  install -Dm755 seriesmeta "${pkgdir}/usr/bin/seriesmeta"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
