# Maintainer: Daniel Micay <danielmicay@gmail.com>
_gitname=termite
pkgname=termite-git
pkgver=10
pkgver() { cd $_gitname && git describe | sed 's/^v//; s/-/./g'; }
pkgrel=1
epoch=1
pkgdesc="A simple VTE-based terminal"
arch=('i686' 'x86_64')
url="https://github.com/thestinger/termite/"
license=('LGPL')
depends=('vte3-ng')
makedepends=('git')
provides=(termite)
conflicts=(termite)
backup=(etc/xdg/termite/config)
source=(git://github.com/thestinger/termite)
md5sums=(SKIP)

build() {
  cd $_gitname
  git submodule update --init
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 config "$pkgdir/etc/xdg/termite/config"
}
