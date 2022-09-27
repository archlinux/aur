# Maintainer: grimi
pkgname=libzakalwe-git
pkgver=r15.976e1a8
pkgrel=1
pkgdesc="A shared tools library."
arch=("x86_64")
url="https://gitlab.com/hors/libzakalwe"
license=("custom")
makedepends=("git" "sparse")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/hors/libzakalwe.git")
md5sums=("SKIP")


pkgver() {
   cd "${pkgname%-git}"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git}
  sed -i "s|PREFIX = /usr/local|PREFIX = ${pkgdir}/usr|" Makefile
  ./configure
  make
}

package() {
  cd ${pkgname%-git}
  install -d "${pkgdir}/usr/lib"
  make install
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname%-git}/COPYING
}

