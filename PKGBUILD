# Maintainer: Rockeyxx <ommmar310@gmail.com>
pkgname=aj179-linux-battery-git
pkgver=r24.98c248c
pkgrel=1
pkgdesc="Battery daemon and settings tool (ajazzctl) for the Ajazz AJ179 wireless mouse; battery goes to /tmp/ajazz_battery"
arch=('x86_64')
url="https://github.com/Rockeyxx/aj179-linux"
license=('MIT')
depends=()
makedepends=('git' 'gcc' 'make' 'gawk')
provides=('aj179-linux-battery')
conflicts=('aj179-linux-battery')
source=("git+https://github.com/Rockeyxx/aj179-linux.git")
install=aj179-linux-battery.install
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/aj179-linux"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/aj179-linux"
  make
}

package() {
  cd "$srcdir/aj179-linux"
  
  # Execute Makefile file operations, routed to the package directory
  make DESTDIR="$pkgdir" PREFIX=/usr SYSTEMD_DIR=/usr/lib/systemd/system install
}
