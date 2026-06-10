# Maintainer: xotkot
pkgname=batorrent-git
pkgver=4.0.0.r1.g4234a3b
pkgrel=1
pkgdesc='A lightweight BitTorrent client built with C++, Qt 6, and libtorrent-rasterbar.'
arch=(x86_64)
url='https://github.com/Mateuscruz19/BATorrent'
license=(MIT)
conflicts=(batorrent)
provides=(batorrent)
depends=(	libtorrent-rasterbar
			qt6-svg
			qt6-declarative
			qtkeychain-qt6
			qt6-base
			openssl
			libstdc++
			glibc
			libgcc)
makedepends=(git
			cmake
			boost)
source=("$pkgname::git+$url")
b2sums=(SKIP)

pkgver() {
  cd "$pkgname"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j
}

package() {
  cd "$pkgname"
  install -Dm0755 "$srcdir/$pkgname/build/BATorrent" 	"$pkgdir/usr/bin/BATorrent"
  install -Dm0644 "$srcdir/$pkgname/LICENSE" 			"$pkgdir/usr/share/licenses/BATorrent/LICENSE"
}
