# Maintainer: Aaron Kaiser <a_kaiser+arch at posteo dot de>

pkgname=age-keylookup
pkgver=0.10.0
pkgrel=2
pkgdesc='A tool to look up age public keys from a keyserver'
arch=('x86_64')
url="https://github.com/FiloSottile/torchwood"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('28a747cf6d0fc095eac9748c7d9a9e3670b76061a69bb58b986881069390c31db5a615601a674cd041fcdfb0349c99a272dd6bc032468703ae4869942545418e')

build() {
  cd "torchwood-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X main.Version=$pkgver -linkmode external -extldflags \"$LDFLAGS\"" \
    -o . ./cmd/age-keylookup
}

package() {
  cd "torchwood-$pkgver"
  install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
