# Maintainer: Adrien Smith <adrien at bouldersmiths dot com>
pkgname=overmind
pkgver=2.2.0
pkgrel=1
pkgdesc="Process manager for Procfile-based applications and tmux"
arch=("x86_64")
url="https://github.com/DarthSim/$pkgname"
license=("MIT")
depends=('tmux')
makedepends=("go-pie")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2a3619af7f64108b207fc8d28244765febaa28e1acab3e427d19ea6024408aeb0623c0e22c551b8a998a1c66ee71b9e21472e16211243310687b0a3b3e3c647f')
b2sums=('a141746ca097abbc3b5bc22d62747c3a9ddad82c67571f0f149e0ffa1a5a171455e64cb53ee716be82b4656eb852ecdcace2c4767be1d33e38453e0a2e26fbf4')

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
