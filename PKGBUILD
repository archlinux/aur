# Maintainer: fsckd <fsckdaemon at gmail dot com>

pkgname=jo-git
pkgver=1.9.r6.g02be130
pkgrel=1
pkgdesc='A shell command to create JSON'
arch=('i686' 'x86_64')
url='https://github.com/jpmens/jo'
license=('GPL' 'MIT')
provides=('jo')
conflicts=('jo')
makedepends=('git')
source=('git+https://github.com/jpmens/jo')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/jo"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/jo"
  autoreconf -vi
  ./configure --prefix=/usr
  make all
}

package() {
  cd "$srcdir/jo"
  make DESTDIR="$pkgdir" install
}
