# Maintainer: Joar Heimonen <joar@lightside-instruments.com>

pkgname=yuma123-git
pkgver=latest
pkgrel=1
pkgdesc="Open-source YANG API in C, yangcli and netconfd server"
arch=('any')
url="https://github.com/vlvassilev/yuma123"
license=('BSD')
depends=()
makedepends=('git' 'autoconf' 'automake' 'make' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+https://github.com/vlvassilev/yuma123#commit=4ede28d5ca03c7474b30e57f04da18bb7f6f3f48")

prepare() {
  cd "$srcdir/yuma123"
  autoreconf -i -f
}

build() {
  cd "$srcdir/yuma123"
  ./configure CFLAGS='-O2' CXXFLAGS='-O2' --prefix=/usr
  make
}

package() {
  cd "$srcdir/yuma123"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/bin/sbin/netconfd" "${pkgdir}/usr/bin/netconfd"
  mv "${pkgdir}/usr/bin/sbin/netconf-subsystem" "${pkgdir}/usr/bin/netconf-subsystem"
  rm -rf "${pkgdir}/usr/sbin"
}

sha256sums=('aeb37e1e19251238de0a4e3f7bfed0adc90e15f92abf1fd6956ea22f2ffee462') 