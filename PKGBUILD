#Maintainer: Maxb0tbeep <max@polygonal.place)
pkgname=meow-git
pkgver=1.0.0.r0.gabc1234  # This will be dynamically generated
pkgrel=1
pkgdesc="A better AUR helper, powered by nim"
arch=(x86_64)
url="https://gitlab.com/Maxb0tbeep/meow"
license=('GPLv3')
makedepends=(nim git)
provides=(meow)
source=("git+$url.git#branch=main")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/meow"
  local ver
  ver=$(git describe --long --tags 2>/dev/null || git rev-parse --short HEAD)
  printf "%s" "$(echo "$ver" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}


build() {
  cd "$srcdir/meow"
  nimble build -d:release -y
}

package() {
  cd "$srcdir/meow"
  install -Dm755 "build/meow" "$pkgdir/usr/bin/meow"
}

