# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=omnispeak
pkgver=1.1
pkgrel=1
pkgdesc='An open-source re-implementation of "Commander Keen in Goodbye Galaxy"'
arch=("x86_64")
url="https://davidgow.net/keen/omnispeak.html"
license=("GPL2")
makedepends=("cmake")
optdepends=("omnispeak-data: full game data from GOG")
source=(
  "https://github.com/sulix/$pkgdir/archive/refs/tags/v$pkgver.tar.gz"
  "omnispeak-keen4"
  "omnispeak-keen5"
)
sha256sums=(
  "1db9e3d740ee816e0ba784cd5147c29ad3b1ebf1a694cdf6324df7cb439ba028"
  "00f73611a8989002dd7c5a4e8aa2f93799735fec3e7e22b1c3c465fb3eae73ae"
  "6692edb336c32a5528a32e1ab528588476b42433754c12213676cb3b3ba7ea14"
)

build() {
  cmake -B build -S "$srcdir/$pkgname-$pkgver"
  XDGUSERPATH=1 cmake --build build
}

package() {
  mkdir -p "$pkgdir/usr/share"
  cp -r "$srcdir/$pkgname-$pkgver/data" "$pkgdir/usr/share/omnispeak"
  chmod 644 "$pkgdir/usr/share/omnispeak/keen6e14"/*

  install -Dm 755 "$srcdir/build/omnispeak" "$pkgdir/usr/bin/omnispeak"
  install -Dm 755 "$srcdir/omnispeak-keen4" "$pkgdir/usr/bin/omnispeak-keen4"
  install -Dm 755 "$srcdir/omnispeak-keen5" "$pkgdir/usr/bin/omnispeak-keen5"
}
