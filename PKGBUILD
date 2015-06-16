# Maintainer: FzerorubigD <fzerorubigd {AT} GMail {DOT} com>
pkgname=zacman-git
pkgver=9.0502696
pkgrel=1
pkgdesc="Another package manager for zsh"
arch=('i686' 'x86_64')
url="https://github.com/fzerorubigd/zacman"
license=('MIT')
depends=()
makedepends=('go' 'git' 'gb-git')
source=('git://github.com/fzerorubigd/zacman.git')

sha1sums=('SKIP')

_gitname=zacman

pkgver() {
        cd "${srcdir}/${_gitname}"
        echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
        cd "${srcdir}/${_gitname}"
	git submodule init 
	git submodule sync 
	git submodule update
	gb build
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -m755 $srcdir/${_gitname}/bin/zacman $pkgdir/usr/bin/zacman
}
