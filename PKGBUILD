# Maintainer: Denis Yantarev <denis dot yantarev at gmail dot com>

_pkgname=bstring
pkgname=bstring-git
pkgver=1.1.1.r1.g8a2d9ce
pkgrel=1
pkgdesc='Better String Library'
url='https://mike.steinert.ca/bstring'
license=('BSD-3-Clause')
source=("git+https://github.com/msteinert/bstring")
md5sums=('SKIP')
arch=('x86_64' 'i686' 'pentium4' 'armv6h' 'armv7h' 'aarch64')
makedepends=('meson')
depends=('glibc')
conflicts=("$_pkgname")
provides=("$_pkgname")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$_pkgname"
  DESTDIR="$pkgdir" meson install -C build
}

