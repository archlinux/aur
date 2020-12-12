# Maintainer: maz-1 <ohmygod19993 at gmail dot com>
pkgname=sfarklib-git
_gitname=sfArkLib
pkgver=20200903
pkgrel=2
pkgdesc="Library for decompressing sfArk soundfonts."
arch=(x86_64)
url="https://github.com/raboof/sfArkLib"
license=('GPL3')
depends=('zlib')
makedepends=('git')
provides=('sfarklib')
conflicts=('sfarklib')
source=('git+https://github.com/raboof/sfArkLib.git')
md5sums=('SKIP')

pkgver() {
  cd  "$srcdir/$_gitname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

prepare() {
  cd  "$srcdir/$_gitname"
  sed -i 's:/usr/local/:/usr/:g' Makefile
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

