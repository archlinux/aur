# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=pipetoys
pkgver=0.10
_gitcommit=6e6defb619b812669e58716e3ebf88f0aa1fb5a4
pkgrel=1
pkgdesc="Convert between pipes and chunked files"
url="https://github.com/AndyA/pipetoys"
arch=('i686' 'x86_64')
makedepends=('autoconf')
options=('strip' 'docs')
source=("https://github.com/AndyA/pipetoys/archive/${_gitcommit}.zip")
md5sums=('b3edfb441859a80d8e24f7d849f4b34e')

prepare() {
  cd "$srcdir/$pkgname-${_gitcommit}"
  sed -i '/^perl/d' tools/get-version.sh
  echo '#define V_INFO "0.10 (May 2013)"' >version.h
}

build() {
  cd "$srcdir/$pkgname-${_gitcommit}"
  autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc 
  make
}

package() {
  cd "$srcdir/$pkgname-${_gitcommit}"
  make DESTDIR="$pkgdir" install
  install -Dm644 README.md "$pkgdir/usr/share/doc/pipetoys/README"
}
