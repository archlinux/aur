# Maintainer: EndlessEden <eden.rose (at) deep-rose.org>
# smplayer-skins-svn Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=smplayer-skins-git
pkgver=20.11.0.rc3d8454
pkgrel=1
pkgdesc="Skins for SMPlayer"
arch=('any')
url="https://smplayer.info/"
license=('GPL')
depends=('smplayer')
makedepends=('git')
provides=('smplayer-skins')
conflicts=('smplayer-skins' 'smplayer-skins-svn')
source=("$pkgname::git+https://github.com/smplayer-dev/smplayer-skins.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo "$(echo $(git tag 2>/dev/null | head -2 | tail -1 | sed 's|v||g')$(echo .r`git rev-parse --short HEAD 2>/dev/null` ))"
}

build() {
  cd $pkgname
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

