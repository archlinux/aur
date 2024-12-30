# Contributor: Omar Alkersh <oalkersh at protonmail dot com>

pkgname=shortcut-mapper-git
pkgver=0.1.2.r0.g7da8094
pkgrel=1
pkgdesc='creates "key string" binding to execute commands'
arch=(x86_64)
url="https://github.com/OZoneGuy/shortcut-mapper.git"
license=('GPL-3.0-or-later')
depends=(xorg-server)
makedepends=(git cmake)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "shortcut-mapper"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S shortcut-mapper -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -dm755 "$pkgdir/usr/"
  mv -v "$pkgdir"/{bin,usr}/
}
