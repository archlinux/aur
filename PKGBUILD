# Maintainer: Martin Hundebøll <martin@hundeboll.net>
_pkgname=tio
pkgname=$_pkgname-git
pkgver=1.36.r2.g8975c44
pkgrel=1
pkgdesc="The simple TTY terminal I/O application"
url="http://tio.github.io"
arch=('x86_64' 'i686')
license=('GPLv2')
conflicts=('tio')
provides=('tio')
depends=('glibc' 'libinih')
makedepends=('git' 'meson')
source=("git+https://github.com/tio/tio.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  meson --prefix=/usr --buildtype=plain . build
  meson compile -C build
}

package() {
  cd "$srcdir/$_pkgname"
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
