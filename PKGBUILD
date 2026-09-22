# Maintainer: Hong Shick Pak <hong@hspak.com>

pkgname=cosmurgy
pkgver=0.2.0
pkgrel=1
pkgdesc="Infrastructure mutator and state tracker"
arch=("x86_64")
url="https://github.com/hspak/cosmurgy"
license=("MIT")
depends=("ca-certificates")
makedepends=("go>=1.25.0")
options=("!debug")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=("bf4ce469f1a25cb398383954ab578aaa3c20ae15975e7056b1d460a8cabd769a")

build() {
  cd "$pkgname-$pkgver"
  COSMURGY_VERSION="$pkgver" COSMURGY_REVISION="dfb9da450c51eb0b4108ba58af3fe52726ae5afc" bash scripts/build.sh
  cp bin/cosmurgy cosmurgy
}

check() {
  cd "$pkgname-$pkgver"
  ./cosmurgy help >/dev/null
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 cosmurgy "$pkgdir/usr/bin/cosmurgy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
