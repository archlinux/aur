# Maintainer: fabbe (fabbe@carajo.no)

pkgname=bubbles-git
pkgver=gitrev
pkgrel=1
pkgdesc="bubbles is opinionated, tiny, bloat-less (=> fast) floating window manager for X."
arch=('i686' 'x86_64')
url="https://git.carajo.no/bubbles/tree/README.md"
license=('GPL')
depends=('libx11' 'libxft')
optdepends=('libxinerama' 'libxfixes')
provides=("${pkgname%-*}")
source=('git+https://git.carajo.no/bubbles')
md5sums=('SKIP')

pkgver() {
  # Get the tag of the latest commit
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-*}
  make
}

package() {
  cd ${pkgname%-*}
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
