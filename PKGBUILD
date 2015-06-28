# Maintainer: aksr <aksr at t-com dot me>
pkgname=cplay-git
pkgver=1.50pre7.r9.g5d3556b
pkgrel=1
epoch=
pkgdesc="A curses front-end for various audio players."
arch=('i686' 'x86_64')
url="https://github.com/holizz/cplay"
license=('GPLv2')
groups=()
depends=('ncurses' 'python2')
makedepends=('git')
optdepends=('mpg321' 'mpg123' 'vorbis-tools' 'speex')
checkdepends=()
provides=()
conflicts=('cplay')
replaces=()
backup=('etc/cplayrc')
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/holizz/cplay.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i '1s,env python,&2,' cplay
  sed -i 's|$(PREFIX)/man/man1|$(PREFIX)/share/man/man1|' Makefile
}

build() {
  cd "$srcdir/$pkgname"
  make
  make cplayrc
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/{bin,share/man/man1}
  make PREFIX=$pkgdir/usr install
  install -Dm644 cplayrc $pkgdir/etc/cplayrc
}

