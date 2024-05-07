# Maintainer: Darkgeem <darkgeem [at] pyrokinesis [dot] fr>

pkgname=cmatrix-neo-git
pkgver=0.6.1
pkgrel=1
url="https://github.com/st3w/neo"
pkgdesc="A ncmatrix fork with true colors and unicode support (${url})"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'autoconf' 'automake')
source=("$pkgname::git+https://github.com/st3w/neo.git")
md5sums=('SKIP')

pkgver() {
	cat "$srcdir/$pkgname/configure.ac" \
		| grep ^AC_INIT \
		| cut -d']' -f2 \
		| cut -d'[' -f2 \
		| tr -d '\n'
}

prepare() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
