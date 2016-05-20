# Maintainer: Martin Hundebøll <martin@hundeboll.net>
_pkgname=tio
pkgname=$_pkgname-git
pkgver=1.13.r7.gdc455eb
pkgrel=1
pkgdesc="The simple TTY terminal I/O application"
url="http://tio.github.io"
arch=('x86_64' 'i686')
license=('GPLv2')
conflicts=('tio')
provides=('tio')
makedepends=('git')
source=("git+https://github.com/tio/tio.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
