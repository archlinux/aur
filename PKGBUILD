# Maintainer: Emmanuel Gil Peyrot <emmanuel.peyrot@collabora.com>

_pkgname=libiio
pkgname="$_pkgname-git"
pkgver=v0.9.r25.g68c3089
pkgrel=1
pkgdesc="TODO"
arch=('i686' 'x86_64' 'armv7h')
url="https://wiki.analog.com/resources/tools-software/linux-software/libiio"
license=('TODO')
depends=()
makedepends=('git')
source=("$_pkgname::git+https://github.com/analogdevicesinc/libiio")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p "$srcdir/$_pkgname/build"
}

build() {
  cd "$srcdir/$_pkgname/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DCSHARP_BINDINGS=OFF
  make
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sts=2 sw=2 et:
