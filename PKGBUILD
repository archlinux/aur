# Maintainer: thriqon <mail@jonasw.de>

pkgname=involucro
pkgver=1.0.1
pkgrel=1
pkgdesc="build and deliver software with containers"
arch=('x86_64' 'i686')
url="https://github.com/thriqon/involucro"
license=('Apache')
depends=('glibc')
makedepends=('go' 'gzip')
options=('!strip' '!emptydirs')
source=("https://github.com/thriqon/involucro/archive/v1.0.1.tar.gz")
sha1sums=("7bcdbb8f6b246e60adaaffbfd2340e227bebd013")

build() {
  cd "$pkgname-$pkgver"

  go build  -ldflags "-s -w -X github.com/thriqon/involucro/app.version=$pkgver" ./cmd/involucro
  gzip -f docs/involucro.1
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 docs/involucro.1.gz "$pkgdir/usr/share/man/man1/involucro.1.gz"
}

# vim:set ts=2 sw=2 et:
