# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=fetlang-git

pkgver=r216.73a78ad
pkgrel=2
pkgdesc="fetish-themed programming language"
arch=('i686' 'x86_64')
url="https://github.com/Property404/fetlang"
license=('custom')

depends=('gcc-libs')
makedepends=('meson')

conflicts=('fetlang')
provides=('fetlang')

source=("$pkgname::git+https://github.com/Property404/fetlang")

md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p $srcdir/$pkgname/build
}

build() {
  cd $srcdir/$pkgname/build

  meson setup \
    --prefix=/usr \
    --buildtype=release \
    ../src

  ninja
}

check() {
  cd $srcdir/$pkgname/build

  ninja test
}

package() {
  cd $srcdir/$pkgname/build

  DESTDIR=$pkgdir ninja install

  install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
