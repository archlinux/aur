# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=pixz-git

pkgver=r206.8d318b9
pkgrel=1
pkgdesc="parallel, indexed xz compressor"
arch=('i686' 'x86_64')
url="https://github.com/vasi/pixz"
license=('custom')
depends=('libarchive')
makedepends=('asciidoc')
checkdepends=('cppcheck')
conflicts=('pixz')
provides=('pixz')

source=("$pkgname::git+https://github.com/vasi/pixz")

md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname

  ./autogen.sh
}

build() {
  cd $srcdir/$pkgname

  ./configure --prefix=/usr

  make
}

check() {
  cd $srcdir/$pkgname

  make check
}

package() {
  cd $srcdir/$pkgname

  make DESTDIR=$pkgdir install

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
