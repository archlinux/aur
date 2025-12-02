# Maintainer: Lefthook <lefthook@evilmartians.com>

pkgname=lefthook
pkgdesc="Git hooks manager"
pkgver=2.0.5
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
makedepends=('go>=1.25')
source=("https://github.com/evilmartians/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('4ae060253ce4f045caf4188abbd540c8baf186aa6f836647a397e1903da85e01')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
