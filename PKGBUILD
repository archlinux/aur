# Maintainer: Alberto Fanjul <albertofanjul@gmail.com>
pkgname=jsrdbg-git
_name=jsrdbg
pkgver=133.1fc4419
pkgrel=1
pkgdesc="JavaScript Remote Debugger for SpiderMonkey."
arch=('i686' 'x86_64')
url="https://github.com/swojtasiak/jsrdbg"
license=('GPL')
depends=(git)
provides=("jsrdbg-git")
replaces=("jsrdbg")
conflicts=("jsrdbg")
source=("$_name::git+https://github.com/swojtasiak/jsrdbg.git#branch=master")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_name"
  autoreconf -i
  ./configure --prefix=/usr 
  make
}

check() {
  cd "$srcdir/$_name"
  make check
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir/" install
}

pkgver() {
  cd "$srcdir/$_name"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
