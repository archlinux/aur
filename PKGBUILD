# Maintainer: Andres Rodriguez Michel <andresmichelrodriguez@gmail.com>
pkgname=bullseye
pkgver=2.0.0
pkgrel=1
pkgdesc="Control mouse cursor using your keyboard"
arch=(any)
url="https://github.com/Dosx001/bullseye"
makedepends=(zvm)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("136d0135c1fa983d7b0512c409a5f97cd860fcef2be78c97f06a5318a6f65641")

prepare() {
  zvm i 0.17.0
}

build() {
  cd $pkgname-$pkgver
  zvm run build -Drelease
}

package() {
  cd $pkgname-$pkgver
  for i in 32x32 128x128 256x256; do
    install -Dm644 pkg/assets/$i.png "$pkgdir/usr/share/icons/hicolor/$i/apps/bullseye.png"
  done
  install -Dm644 pkg/bullseye.desktop "$pkgdir/usr/share/applications/bullseye.desktop"
  install -Dm644 pkg/completion/bullseye "$pkgdir/usr/share/bash-completion/completions/bullseye"
  install -Dm644 pkg/completion/bullseye.fish "$pkgdir/usr/share/fish/vendor_completions.d/bullseye.fish"
  install -Dm644 pkg/completion/_bullseye "$pkgdir/usr/share/zsh/site-functions/_bullseye"
  install -Dm755 zig-out/bin/bullseye "$pkgdir/usr/bin/bullseye"
}
