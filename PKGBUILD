# Maintainer: Martin Hundebøll <martin@hundeboll.net>
_pkgname=gotty
pkgname=$_pkgname-git
pkgver=1.2.r0.g689cedf
pkgrel=1
pkgdesc="Go TTY - The Really Simple TTY Terminal Application"
url="http://gotty.io"
arch=('x86_64' 'i686')
license=('GPLv2')
conflicts=('gotty')
provides=('gotty')
makedepends=('git')
source=("git+https://github.com/gotty/gotty.git")
sha256sums=("SKIP")

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
