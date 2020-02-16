# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="vdens"

pkgname="$_pkgname-git"
pkgver=r27.84f247f
pkgrel=1
pkgdesc="Create User Namespaces connected to VDE networks"
arch=(any)
url="https://github.com/rd235/$_pkgname"
license=('GPL2')
depends=('vdeplug4-git')
makedepends=('git' 'cmake' 's2argv-execs-git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}
