# Maintainer: Anonym3000 <theanonym3000 at icloud dot com>

_pkgbase=birdtray-wayland
pkgname=$_pkgbase-git
pkgver=latest
pkgrel=1
pkgdesc="Run Thunderbird with a system tray icon."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/stark1tty/birdtray-wayland"
license=('GPL-3.0')
depends=(qt5-svg qt5-x11extras)
optdepends=('qt6-translations: Support for translations')
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
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgbase/" $_pkgbase/README.md
}
