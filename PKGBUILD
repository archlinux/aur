# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname=i3lock-fancier-git
_gitname=i3lock-fancier
pkgver=r23.37153ec
pkgrel=1
pkgdesc="i3lock-fancier - yet another i3lock fork"
arch=('i686' 'x86_64')
url="https://github.com/SuperPrower/i3lock-fancier"
license=('BSD')
depends=('cairo' 'libev' 'libx11' 'pam' 'xcb-util-image' 'xcb-util-keysyms' 'libxkbcommon-x11')
makedepends=('git')
provides=('i3lock')
conflicts=('i3lock')
source=("git+https://github.com/SuperPrower/i3lock-fancier.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/i3lock-fancier/LICENSE"
}
