#!/hint/bash
# Maintainer: Adrien Smith <adrien at bouldersmiths dot com>
pkgname=overmind
pkgver=2.2.1
pkgrel=1
pkgdesc="Process manager for Procfile-based applications and tmux"
arch=("x86_64")
url="https://github.com/DarthSim/$pkgname"
license=("MIT")
depends=('tmux')
makedepends=("go")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('d616cad5defc204c20e9d679d4a6d87886044dff5173e9e836aa782d8e1b4271189fcaf14f7ee4b2cea70b738b59d6561bf51b2e0d9e2944e76709de7c2e2300')
b2sums=('0d4abe280c89818f695d7c205d6cbb9773d75521df3f50dbc8062cdc844c4183d90e38a1d38ffb61f80a3581a511b06acc6715f34989f2f9cd7f3e1bbf8737cf')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o $pkgname .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
