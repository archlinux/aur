# Maintainer: Lefthook <lefthook@evilmartians.com>

pkgname=lefthook
pkgdesc="Git hooks manager"
pkgver=2.0.7
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
makedepends=('go>=1.25')
source=("https://github.com/evilmartians/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('edf4e3025809bdc459c6e400ca8e198c2d2e38bdf154c3c40196bb9720257206')

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
