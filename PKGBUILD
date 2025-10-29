# Maintainer: Gurov
pkgname=zeptofetch-git
pkgver=latest
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux (git version)"
arch=('x86_64')
url="https://github.com/Gur0v/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'gcc' 'make')
provides=('zeptofetch')
conflicts=('zeptofetch' 'zeptofetch-bin')
source=("git+https://github.com/Gur0v/zeptofetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/zeptofetch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/zeptofetch"
  make CFLAGS="-std=c99 -D_POSIX_C_SOURCE=200809L -D_DEFAULT_SOURCE -march=native -O3 -flto=auto -pipe -Wall -Wextra -Wpedantic -ffunction-sections -fdata-sections"
}

package() {
  cd "$srcdir/zeptofetch"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
