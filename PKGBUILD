# Maintainer: Vniverse77 <vniverse77@porotonmail.com>
pkgname=pacforge
pkgver=1.0.0
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
sha256sums=('de758b5fc9ad118a588e094b9879c88b58afb5a68498e4aeb9e22d60687f45b9')

build() {
  cd "byte-knight-$pkgver"
  g++ -std=c++17 -O2 -Wl,-z,relro,-z,now -o pacforge source/pacForge.cpp -lpthread
}

package() {
  cd "byte-knight-$pkgver"
  install -Dm755 pacforge "$pkgdir/usr/bin/pacforge"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
