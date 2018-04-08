# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=whatsapp-purple-git
pkgver=0.9.0.r2.07ed931
pkgrel=2
pkgdesc="WhatsApp protocol implementation for libpurple (Pidgin)"
arch=("i686" "x86_64")
url="https://github.com/davidgfnet/${pkgname%-git}"
license=("GPL")
depends=("libpurple" "freeimage")
makedepends=("git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/davidgfnet/${pkgname%-git}.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[a-Z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make ARCH="${CARCH}"
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="${pkgdir}/" install
}
