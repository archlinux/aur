# Maintainer: fsckd <fsckdaemon at gmail dot com>

pkgname=jo-git
pkgver=0.6.r0.g9bf9f45
pkgrel=1
pkgdesc='A shell command to create JSON'
arch=('i686' 'x86_64')
url='https://github.com/jpmens/jo'
license=('GPL' 'MIT')
provides=('jo')
conflicts=('jo')
makedepends=('git')
source=('git://github.com/jpmens/jo')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/jo"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/jo"
  autoreconf -vi
  ./configure
  make jo
}

package() {
  cd "$srcdir/jo"
  install -Dm755 jo "$pkgdir/usr/bin/jo"
  install -Dm644 jo.1 "$pkgdir/usr/share/man/man1/jo.1"
}
