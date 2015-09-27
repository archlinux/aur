# Maintainer: Beini <bane AT iki dot fi>
# Contributor: Daniel Micay <danielmicay@gmail.com>
_gitname=termite
pkgname=termite-ranger-fix-git
pkgver=10.21.g08e553a
pkgver() { cd $_gitname && git describe | sed 's/^v//; s/-/./g'; }
pkgrel=1
epoch=1
pkgdesc="A simple VTE-based terminal. Includes a fix for w3mimgdisplay"
arch=('i686' 'x86_64')
url="https://github.com/autrimpo/termite/tree/ranger-fix"
license=('LGPL')
depends=('vte3-ng' 'xdg-utils')
makedepends=('git')
provides=('termite' 'termite-git')
conflicts=('termite' 'termite-git')
backup=(etc/xdg/termite/config)
source=(git://github.com/autrimpo/termite.git#branch=ranger-fix)
md5sums=('SKIP')

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
