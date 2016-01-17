# Maintainer: PhiBo <phibo at dinotools dot org>

pkgname=liblcfg-git
pkgver=0.2.2
pkgrel=1
pkgdesc="A lightweight configuration file library written in C99"
url="https://github.com/DinoTools/liblcfg"
license=(BSD)
arch=('i686' 'x86_64')
depends=(glibc)
makedepends=(git)
source=("$pkgname"::'git+https://github.com/DinoTools/liblcfg.git')
md5sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname/code"

  sed -i s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g ./configure.ac 
  autoreconf -i
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname/code"
  make DESTDIR=$pkgdir install
}
 
