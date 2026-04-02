# Maintainer: Vniverse77 <vniverse77@gmail.com>
pkgname=warpcpp
pkgver=0.1.1
pkgrel=0
pkgdesc="A user-friendly C++ TUI for Cloudflare WARP."
arch=('x86_64')
url="https://github.com/Vniverse77/byte-knight"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('gcc')
optdepends=(
  'dpkg: for .deb packages'
  #'rpm-tools: for .rpm packages'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/Vniverse77/byte-knight/archive/v$pkgver.tar.gz")
sha256sums=('efa3a40c690bfae0b6c41eb098b48a77ee55727a52b9fe85935e056551d409ea')
build() {
  cd "byte-knight-$pkgver"
  g++ -std=c++17 -O2 -Wl,-z,relro,-z,now -o warpcpp src/warp.cpp -lpthread
}

package() {
  cd "byte-knight-$pkgver"
  install -Dm755 warpcpp "$pkgdir/usr/bin/warpcpp"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
