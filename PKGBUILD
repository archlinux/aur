# Maintainer: svexican (svexican@gmail.com)

pkgname=bubbleswm-git
pkgver=8984443
pkgrel=1
pkgdesc="bubbles is opinionated, tiny, bloat-less (=> fast) floating window manager for X."
arch=('i686' 'x86_64')
url="https://github.com/svexican/bubbleswm"
license=('GPL')
depends=('libconfig' 'libx11' 'libxinerama')
provides=("${pkgname%-*}")
source=('git+https://github.com/svexican/bubbleswm.git')
md5sums=('SKIP')

pkgver() {
  # Get the tag of the latest commit
  cd ${pkgname%-*}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-*}
  msg "Starting make..."
  make

  git submodule init
  git submodule update

  cd xowl
  make
}

package() {
  cd ${pkgname%-*}
  make DESTDIR="$pkgdir" PREFIX="/usr" install

  cd xowl
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
