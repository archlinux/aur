# Maintainer: aalhitennf <paananen.olli@tuta.io>

pkgname=rusko-server
_pkgname=rusko
pkgver=0.1.1
pkgrel=1
pkgdesc='Remote server for rusko mobile client'
url='https://github.com/aalhitennf/rusko-client'
license=(GPL3)
arch=(x86_64)
depends=(xdotool)
makedepends=(cargo rust)
conflicts=(rusko-server)
provides=(rusko-server)
source=("https://github.com/aalhitennf/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ce7e330e4dc34259f2e2e46fe4b5852d7fd2374e666c7f8eff1bcd93e9540e0b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  strip "target/release/$_pkgname"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
