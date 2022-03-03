# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gammy
pkgver=0.9.64
pkgrel=4
pkgdesc="Adaptive screen brightness/temperature tool."
arch=('x86_64')
url="https://getgammy.com"
license=('GPL3')
depends=('mesa' 'qt5-base')
makedepends=('imagemagick')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fushko/gammy/archive/v$pkgver.tar.gz"
        'https://github.com/Fushko/gammy/pull/119.patch')
sha256sums=('b3dc0f4babd34f8eb6d6e2b6528f916151c82e6a8fa01dba41c6c3a2b42d94ed'
            '8b96a361c39351cde45d73947f55ad1d64b98c43617dad5a3c901c6c668ba1ed')

prepare() {
  cd "$pkgname-$pkgver"

  # fix gcc11 compilation error
  patch -Np1 -i $srcdir/119.patch
}

build() {
  cd "$pkgname-$pkgver"
  qmake-qt5
  make
}

package() {
  cd "$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install
}
