# shellcheck disable=2034,SC2164
# Maintainer: Andres Rodriguez Michel <andresmichelrodriguez@gmail.com>
pkgname=bullseye
pkgver=1.1.0
pkgrel=1
pkgdesc="Control mouse cursor using your keyboard"
arch=(any)
makedepends=(cargo pnpm webkit2gtk xdotool)
url="https://github.com/Dosx001/bullseye"
source=("https://github.com/Dosx001/bullseye/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("33e67faf13fec29abe337cf80fcd15ca")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  pnpm i --frozen-lockfile
  pnpm tauri build -b deb
}

package() {
  cd bullseye-$pkgver/src-tauri/target/release/bundle/deb/bullseye_${pkgver}_amd64
  tar xpf data.tar.gz -C "$pkgdir"
  install -Dm755 data/usr/bin/bullseye "$pkgdir/usr/bin/bullseye"
}
