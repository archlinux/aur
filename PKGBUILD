pkgname=discord-cpp
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern C++ wrapper for the Discord API"
arch=('x86_64')
url="https://github.com/Hydradevx/Discord.CPP"
license=('MIT')
depends=('curl')
makedepends=('cmake' 'git' 'make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/Discord.CPP-$pkgver"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/Discord.CPP-$pkgver"
  install -Dm755 build/libdiscord_cpp.a "$pkgdir/usr/lib/libdiscord_cpp.a"
  install -d "$pkgdir/usr/include/discord"
  cp -r include/* "$pkgdir/usr/include/discord/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
