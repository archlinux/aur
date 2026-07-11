# Maintainer: Alexander Sebastian Kalis
pkgname=mouse-hardware-fix-git
pkgver=r4.239ed97
pkgrel=1
pkgdesc="A lightweight C++ daemon for Linux that fixes physical scroll wheel bouncing and click chatter"
arch=('x86_64')
url="https://github.com/Aleynikovich/mouse-hardware-fix"
license=('GPL')
depends=('glibc' 'gcc-libs' 'systemd')
makedepends=('git' 'gcc')
provides=('mouse-hardware-fix')
conflicts=('mouse-hardware-fix')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd mouse-hardware-fix
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd mouse-hardware-fix
  g++ -O3 mouse-hardware-fix.cpp -o mouse-hardware-fix
}

package() {
  cd mouse-hardware-fix
  install -Dm755 mouse-hardware-fix "$pkgdir/usr/bin/mouse-hardware-fix"
  install -Dm644 mouse-hardware-fix@.service "$pkgdir/usr/lib/systemd/system/mouse-hardware-fix@.service"
  install -Dm644 99-mouse-fix.rules "$pkgdir/usr/lib/udev/rules.d/99-mouse-fix.rules"
}
