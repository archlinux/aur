# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=x-corners
pkgver=0.2.1
pkgrel=1
pkgdesc='A command line tool to set up hot corners under X11'
arch=('i686' 'x86_64')
license=('ISC')
url='https://github.com/mstraube/x-corners'
depends=('libxi')
makedepends=('libxfixes')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mstraube/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('95185a822d38ad97720272fe329de72ea573fc82402fcbfd90d5061258635218')

prepare() {
  cd $pkgname-$pkgver

  # Use Arch's CFLAGS
  sed -i  "s/-O2/$CFLAGS/" Makefile
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
