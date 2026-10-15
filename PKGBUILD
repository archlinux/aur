# Maintainer: Aaron Kaiser <a_kaiser+arch at posteo dot de>

pkgname=age-keylookup
pkgver=0.10.0
pkgrel=1
pkgdesc='A tool to look up age public keys from a keyserver'
arch=('x86_64')
url="https://github.com/FiloSottile/torchwood"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('go')
source=("git+$url#tag=v$pkgver")
sha512sums=('6000f6bf6371039c2b3c82f6f86ef53c5f5afc4803d8166e8107a0d35e7fa97c2936cf7790ab37a4e22a5e79362df6e7c609ceb4cacdd602c400563f345042c2')

build() {
  cd "torchwood"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X main.Version=$pkgver -linkmode external -extldflags \"$LDFLAGS\"" \
    -o . ./cmd/age-keylookup
}

package() {
  cd "torchwood"
  install -Dm755 -t "$pkgdir/usr/bin/" "$pkgname"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
