# Maintainer: Gabriele Fulgaro <gabriele.fulgaro@gmail.com>

_pkgname="vdens"

pkgname="$_pkgname-git"
pkgver=r20.c65c775
pkgrel=2
pkgdesc="Create User Namespaces connected to VDE networks"
arch=(any)
url="https://github.com/rd235/$_pkgname"
license=('GPL2')
groups=('view-os')
depends=('vdeplug4')
makedepends=('vdeplug4')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  autoreconf -if
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" install
}
