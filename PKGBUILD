# Maintainer: Sergio Conde <skgsergio@gmail.com>

pkgname=tablet-mode-vswitch-git
pkgver=r5.2beb811
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
