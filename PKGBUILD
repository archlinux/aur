# Maintainer: Edward Pacman <edward at edward-p dot xyz>

pkgname=k5prog-git
pkgver=r31.241ab18
pkgrel=2
pkgdesc="Quansheng UV-K5 EEPROM programmer"
arch=("x86_64")
url="https://github.com/sq5bpf/k5prog"
license=('GPL-3.0-or-later')
depends=()
makedepends=(git)
source=("${pkgname}::git+https://github.com/sq5bpf/k5prog.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build(){
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 k5prog "${pkgdir}/usr/bin/k5prog"
}
