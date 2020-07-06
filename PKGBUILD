# Maintainer: William Wennerström <william@willeponken.me>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Evan Gates    <evan.gates@gmail.com>
# Contributor: Dag  Odenhall <dag.odenhall@gmail.com>
# Contributor: Chris Brannon <cmbrannon@cox.net>
# Contributor: William Giokas <1007380@gmail.com>
pkgname=ii-git
_pkgname=ii
pkgver=1.8.11.gecf3902
pkgver(){
  cd $_pkgname
  git describe --tags | sed 's/-/./g'
}
pkgrel=1
pkgdesc="A minimalist FIFO and filesystem-based IRC client"
license=('MIT')
arch=('i686' 'x86_64')
url=http://tools.suckless.org/ii
depends=('glibc' 'sh')
makedepends=('git')
provides=('ii')
conflicts=('ii')
epoch=1
source=("$_pkgname::git+http://git.suckless.org/ii")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  sed -i "s/CFLAGS = /CFLAGS = ${CFLAGS} /" config.mk
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D README CHANGES FAQ -t $pkgdir/usr/share/doc/$pkgname/
}
