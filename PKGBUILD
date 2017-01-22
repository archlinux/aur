# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Sabart Otto - Seberm <seberm[at]gmail[dot].com

pkgname=ttyqr-git
pkgver=r5.56f7658
pkgrel=1
pkgdesc="Draw QR codes straight into the terminal"
url="https://github.com/oskar456/ttyqr"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qrencode')
makedepends=('git')
source=("git+https://github.com/oskar456/ttyqr.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-git}
  # Use Arch's CFLAGS
  sed -i 's/-ggdb/$(CFLAGS)/' Makefile
}

build() {
  cd ${pkgname%-git}
  make
}

package() {
  cd ${pkgname%-git}
  install -Dm755 ttyqr "${pkgdir}"/usr/bin/ttyqr
}
