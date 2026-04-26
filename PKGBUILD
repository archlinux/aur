# Maintainer: Rockeyxx <ommmar310@gmail.com>
pkgname=aj179-linux-battery-git
pkgver=r6.0952c8c
pkgrel=1
pkgdesc="A lightweight C daemon to read the battery percentage of Ajazz wireless mice"
arch=('x86_64')
url="https://github.com/Rockeyxx/AJ179-linux-battery"
license=('MIT')
depends=('libusb')
makedepends=('git' 'gcc' 'make' 'gawk')
provides=('aj179-linux-battery')
conflicts=('aj179-linux-battery')
source=("git+https://github.com/Rockeyxx/AJ179-linux-battery.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/AJ179-linux-battery"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/AJ179-linux-battery"
  make
}

package() {
  cd "$srcdir/AJ179-linux-battery"
  
  # Execute Makefile file operations, routed to the package directory
  make DESTDIR="$pkgdir" PREFIX=/usr SYSTEMD_DIR=/usr/lib/systemd/system install
}
