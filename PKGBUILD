# Maintainer: Jonathon Fernyhough <jonathon_at_manjaro dot+org>
# Contributor: Kr1ss <kr1ss.x#yandex#com>

_pkgbase=birdtray
pkgname=$_pkgbase-git
pkgver=latest
pkgrel=3
pkgdesc="Run Thunderbird with a system tray icon."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/gyunaev/birdtray"
license=('GPL-3.0')
depends=(qt5-base sqlite3)
makedepends=(cmake git qt5-tools)
conflicts=($_pkgbase)
provides=($_pkgbase)
source=("git+$url.git")
sha1sums=(SKIP)

pkgver() {
  git -C $_pkgbase describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^RELEASE_//g'
}

build() {
  mkdir -p build && cd build
  cmake ../$_pkgbase \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../$_pkgbase/README.md -t"$pkgdir/usr/share/doc/$_pkgbase/"
}
