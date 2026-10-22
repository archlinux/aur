# Maintainer: Adam Mlady <adam.mlady@elevated.ovh> -> https://github.com/TheElevatedOne

pkgname=ghost-dl-git
pkgver=2.2.0_r2_g258d649
pkgrel=1
pkgdesc="Kingdom Hearts Insider Game OST Archive Downloader CLI/TUI"
arch=('x86_64' 'aarch64')
url="https://github.com/TheElevatedOne/ghost-dl"
license=('GPL-3.0-or-later')
depends=('glibc' 'curl' 'ncurses')
makedepends=(
  'git'
  'gcc'
  'make'
)
provides=(ghost-dl)
conflicts=(ghost-dl)
source=("git+https://github.com/TheElevatedOne/ghost-dl.git#branch=main")
sha256sums=("SKIP")

pkgver() {
  cd ghost-dl
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/_/g' || echo "2.2.0"
}

build() {
  cd ghost-dl
  make PREFIX=/usr
}

package() {
  cd ghost-dl
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
