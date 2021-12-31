# Maintainer: f (bubbles@263.nu)

pkgname=bubbles-git
pkgver=gitrev
pkgrel=1
pkgdesc="bubbles is opinionated, tiny, bloat-less (=> fast) floating window manager for X."
arch=('i686' 'x86_64')
url="https://git.263.nu/f/bubbles/tree/README.md"
license=('GPL')
depends=('libx11' 'libxft')
optdepends=('libxrandr 'libxfixes')
makedepends=('git')
provides=("${pkgname%-*}")
source=('git+https://git.263.nu/f/bubbles')
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
