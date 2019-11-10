# Maintainer: Adrien Smith <adrien at bouldersmiths dot com>
pkgname=overmind
pkgver=2.0.3
pkgrel=1
pkgdesc="Process manager for Procfile-based applications and tmux"
arch=("x86_64")
url="https://github.com/DarthSim/$pkgname"
license=("MIT")
depends=("tmux")
makedepends=("go-pie")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('7586d1bfeb41cdaf54ca8c80f5579c06fac2d2950b4423d15eee03bfef70ddf0c05dd9801237ef7585bcae5e2988567e61b0ce7ea9e3d836764e23851a8d9399')
sha512sums=('9d5af91f226bf4dc27eea921368f2cbf5e98bb5d394d492c0c5f8cf80edb436be49e9568004c4a32dd0897186805f67e457b9956d803cedec6fa9a60cb1f2f7c')

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
