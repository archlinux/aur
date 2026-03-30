# Maintainer: Vniverse77 <vniverse77@porotonmail.com>
pkgname=pacforge
pkgver=1.0.2
pkgrel=1
pkgdesc="A C++ TUI wizard for building .deb and .rpm packages"
arch=(x86_64)
url="https://github.com/Vniverse77/byte-knight"
license=(MIT)
depends=('glibc' 'gcc-libs')
makedepends=('gcc')
optdepends=(
  "dpkg: Required for building .deb packages"
  "rpm-tools: Required for building .rpm packages"
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vniverse77/byte-knight/archive/v$pkgver.tar.gz")
sha256sums=('a19be56dcd3949b66219cfb51ec8ad8aeb894cb6044a2bd2b05dec219481ab1a')

build() {
  cd "byte-knight-$pkgver"
  g++ -std=c++17 -O2 -Wl,-z,relro,-z,now -o pacforge source/pacForge.cpp -lpthread
}

package() {
  cd "byte-knight-$pkgver"
  install -Dm755 pacforge "$pkgdir/usr/bin/pacforge"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
