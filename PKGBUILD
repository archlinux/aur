# Maintainer: Ivy Foster <joyfulgirl@archlinux.us>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.com>

pkgname=conkeror-git
pkgver=120527.1.227.g22a107c
pkgrel=1
pkgdesc="A highly programmable web browser based on Mozilla XULRunner."
arch=('i686' 'x86_64')
url="http://conkeror.mozdev.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('xulrunner' 'desktop-file-utils')
makedepends=('git')
provides=(conkeror)
changelog=Changelog
install=conkeror-git.install
source=('git://repo.or.cz/conkeror.git')
md5sums=('SKIP')
_gitname="conkeror"

pkgver() {
  cd $_gitname
  git describe --always|sed -e 's/debian.*+git//' -e 's/-/./g'
}

build() {
  cd $_gitname
  make PREFIX=/usr
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" PREFIX=/usr install
  rm -f "$pkgdir"/usr/share/doc/conkeror/COPYING
}
