# Maintainer: Lefthook <lefthook@evilmartians.com>

pkgname=lefthook
pkgdesc="Git hooks manager"
pkgver=1.11.15
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
makedepends=('go>=1.24')
source=("https://github.com/evilmartians/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('3d38498e914eeecf9c4164e1ed17f016ef2a78ce1c05fbccdf39b31e28a0c4dc')

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
