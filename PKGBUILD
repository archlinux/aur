# Contributor: mica eked <micaeked at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=blackhole-git
pkgver=0.2.4.g50bb6fd
pkgrel=1
pkgdesc="module system for gambit-c scheme"
arch=('x86_64')
url="http://github.com/pereckerdal/blackhole"
license=('custom')
depends=('glibc')
makedepends=('git' 'gambit-c')
source=("git+https://github.com/pereckerdal/blackhole.git")
md5sums=('SKIP')
options=('!makeflags')
_gitname="blackhole"
LANG=C

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags|sed 's+-+.+g' 
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i 's+gsc +gambitc +g' compile.sh
  sed -i 's+gambc+gambit+g' compile.sh
}

build() {
  cd "$srcdir"/$_gitname
  ./compile.sh
}

package() {
  cd "$srcdir/$_gitname"
  install -D -m755 bh "${pkgdir}/usr/bin/bh"
  install -D -m644 LICENSE \
	  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
