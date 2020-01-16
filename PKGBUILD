# Maintainer: Adrien Smith <adrien at bouldersmiths dot com>
pkgname=overmind
pkgver=2.1.0
pkgrel=1
pkgdesc="Process manager for Procfile-based applications and tmux"
arch=("x86_64")
url="https://github.com/DarthSim/$pkgname"
license=("MIT")
depends=("glibc tmux")
makedepends=("go-pie")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ff34b147a7071eaeda4f581d573037376f2e67443851115a3c78266df4df630b6fcaab894e634bb21cf1bdf562ef296971b01df6486258ac745224e3301cf274')
b2sums=('4f16e6352e31d2427d048af4d519d7b6c473cc20be9987c3d5e3747fd3d06e24afe0c794edd6064b2bce362c067ae0a741796c3300850bfef278c5a0a1c89f9f')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-s -w -extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
