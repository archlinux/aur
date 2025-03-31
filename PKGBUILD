# Maintainer: Lefthook <lefthook@evilmartians.com>

pkgname=lefthook
pkgdesc="Git hooks manager"
pkgver=1.11.6
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
makedepends=('go>=1.24')
source=("https://github.com/evilmartians/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('f573e9b8f08e8b2e26a820dc54f245d3ff9464d3edf3dd9e9b1276401be680aa')

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
