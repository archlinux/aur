# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>
pkgname=libassh-hg
pkgver=r811.2588cc95e3c9
pkgrel=1
pkgdesc="The asynchronous SSH library"
url="http://libassh.org/"
arch=('i686' 'x86_64')
license=('LGPL2.1')
depends=('zlib' 'openssl' 'libsodium' 'libgcrypt')
makedepends=('mercurial' 'autoconf' 'automake' 'libtool')
provides=('libassh')
conflicts=('libassh')
source=('hg+https://hg.savannah.nongnu.org/hgweb/libassh/')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/libassh"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/libassh"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/libassh"
  make DESTDIR="$pkgdir" install
}
