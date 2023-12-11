# Maintainer: Joar Heimonen <joarheimonen@live.no>
# Note: This is only an install script for Yuma123, not the actual project itself.

pkgname=yuma123-git
pkgver=latest
pkgrel=1
pkgdesc="Open-source YANG API in C and CLI (yangcli) and server (netconfd)"
arch=('x86_64')
url="https://github.com/YumaWorks/yuma123"
license=('BSD')
depends=('git' 'autoconf' 'automake' 'make' 'gcc')
makedepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+https://github.com/vlvassilev/yuma123")

prepare() {
  cd "$srcdir/yuma123"
  autoreconf -i -f
}

build() {
  cd "$srcdir/yuma123"
  ./configure CFLAGS='-g -O0' CXXFLAGS='-g -O0' --prefix=/usr
  make
}

package() {
  cd "$srcdir/yuma123"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

sha256sums=('SKIP') 