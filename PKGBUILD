# Maintainer: Sergio Conde <skgsergio@gmail.com>

pkgname=tablet-mode-vswitch-git
pkgver=1.0.r0.g4c1798c
pkgrel=1
pkgdesc="Tablet Mode virtual switch that toggles on HID device connect and disconnect."
arch=("x86_64")
url="https://github.com/skgsergio/tablet-mode-vswitch"
license=("GPL3")
depends=("glibc")
makedepends=("git")
source=("tablet-mode-vswitch-git::git+https://github.com/skgsergio/tablet-mode-vswitch.git")
sha512sums=("SKIP")
provides=("tablet-mode-vswitch")
conflicts=("tablet-mode-vswitch")

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/tablet-mode-vswitch-git/
  make
}

package() {
  cd "$srcdir"/tablet-mode-vswitch-git/
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/lib/systemd/system/
  make PREFIX="$pkgdir" install
}
