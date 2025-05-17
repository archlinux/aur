# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=digital-rain-git
pkgver=r8.d3963c4
pkgrel=4
pkgdesc='Recreate the Digital Rain effect from the Matrix in a standard terminal'
arch=(x86_64)
url=https://github.com/DavidWKnight/Digital-Rain
license=(GPL-3.0-or-later)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i 's/static int droplets_realloc();/static int droplets_realloc(unsigned int new_num_of_droplets);/' $pkgname/droplets.h
}

build() {
  make -C $pkgname
}

package() {
  install -Dm755 $pkgname/Digital_Rain.out "$pkgdir/usr/bin/${pkgname%-git}"
}
