# Maintainer: novenary <streetwalkermc@gmail.com>
# Contributor: Will Vauclain <willvauclain.dev at gmail dot com>
# Contributor: Alex Zaslavsky <alex@wall-dev.org>

pkgname=gebaar-libinput-git
pkgver=r67.098a1ef
pkgrel=1
pkgdesc='A Super Simple WM Independent Touchpad Gesture Daemon for libinput. Forked version with new features'
arch=('x86_64')
url="https://github.com/9ary/gebaar-libinput-fork"
license=('GPL3')
depends=('libinput')
makedepends=('cmake' 'git' 'ninja')
conflicts=('gebaar')
provides=('gebaar')
source=("git+$url")
md5sums=('SKIP')


pkgver() {
  cd gebaar-libinput-fork
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd gebaar-libinput-fork

  cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX="/usr"
  ninja -C build
}

package() {
  cd gebaar-libinput-fork
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
