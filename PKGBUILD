# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: nem <nem@ikitten.co.uk>
pkgname=mantis-wm-git
pkgver=0.11.c5805bd
pkgrel=1
pkgdesc="Lightweight window manager for X"
arch=('i686' 'x86_64')
url="http://github.com/andreas-volker/mantis-wm"
license=('MIT')
depends=('libx11')
makedepends=('git')
source=("$pkgname::git://github.com/andreas-volker/mantis-wm.git")
md5sums=( 'SKIP')

pkgver() {
  cd $pkgname
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd $pkgname
  make VERSION_SUFFIX="-git"
}

package() {
  cd $pkgname
  make VERSION_SUFFIX="-git" \
       PREFIX=$pkgdir/usr \
       ETCDIR=$pkgdir/etc install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

