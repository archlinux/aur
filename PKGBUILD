# Maintainer: fabbe (fabbe@fastmail.com)

pkgname=bubbles-git
pkgver=gitrev
pkgrel=1
pkgdesc="bubbles is opinionated, tiny, bloat-less (=> fast) floating window manager for X."
arch=('i686' 'x86_64')
url="https://git.fabbe.io/bubbles/tree/README.md"
license=('GPL')
depends=('libx11' 'libxft')
optdepends=('libxinerama')
provides=("${pkgname%-*}")
source=('https://git.fabbe.io/bubbles')
md5sums=('SKIP')

pkgver() {
  # Get the tag of the latest commit
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-*}

  msg "Patching default.mk"
  sed -ri 's:# (INCLUDES = -I/usr/include/freetype2):\1:' default.mk

  msg "Starting make..."
  make
}

package() {
  cd ${pkgname%-*}
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
