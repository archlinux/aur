# Maintainer: Lefthook <lefthook@evilmartians.com>

pkgname=lefthook
pkgdesc="Git hooks manager"
pkgver=1.13.2
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
makedepends=('go>=1.24')
source=("https://github.com/evilmartians/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('694d0f5ada0d1e3a3b453e3588984c4e77037684c5d18716ff50b7e1f4eb4570')

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
