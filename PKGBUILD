# Maintainer: lanthora <lanthora at outlook dot com>

pkgname=tellus-git
pkgver=r53.77b218c
pkgrel=1
pkgdesc="Host Intrusion Detection and Prevention System Based on Kernel Module"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/lanthora/tellus"
license=('GPL')
depends=('dkms' 'libnl')
makedepends=('git' 'cmake' 'make' 'go' 'npm' 'nodejs' 'nlohmann-json')
backup=('etc/hackernel/telegram.yaml' 'etc/hackernel/web.yaml')
source=("$pkgname::git+https://github.com/lanthora/tellus.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  make init
}

build() {
  cd "$pkgname"
  make arch-build
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" arch-install
}
