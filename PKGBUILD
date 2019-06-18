# Maintainer: Ilja Kartašov <ik@lowenware.com>
pkgname=aisl-git
_pkgname=aisl
pkgver=1.0.3
pkgrel=1
pkgdesc="Asynchronous Internet Server Library"
url="https://lowenware.com/aisl/"
arch=('i686' 'x86_64')
license=('CCPL')
depends=('openssl')
makedepends=('git')
provides=('libaisl')
conflicts=('libaisl')
epoch=1
source=("git+https://github.com/lowenware/aisl.git")
md5sums=('SKIP')

pkgver(){
  cd $_pkgname
  git describe --tags | sed 's/-/./g'
}

prepare() {
  cd $_pkgname
	sed 's/usr\/local/usr/g' libaisl.pc.example > libaisl.pc
}

build() {
  cd $_pkgname
  make PREFIX=/usr
}

package() {
  cd $_pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -m644 -D README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -m644 -D libaisl.pc "$pkgdir/usr/lib/pkgconfig/libaisl.pc"
}


