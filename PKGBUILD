# Maintainer: archlinux.info:tdy

pkgname=diorite-git
pkgver=r316.4553a50
pkgrel=1
pkgdesc="A utility and widget library for Nuvola Player project based on GLib, GIO, and GTK"
arch=(i686 x86_64)
url=https://tiliado.eu/diorite
license=(GPL)
depends=(gtk3)
makedepends=(git python vala)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+https://github.com/tiliado/${pkgname/-/.})
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  python waf configure --prefix=/usr
  python waf build
}

package() {
  cd $pkgname
  python waf install --destdir="$pkgdir"
}
