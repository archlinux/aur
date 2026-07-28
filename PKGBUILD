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

source=("git+https://github.com/vlvassilev/yuma123#commit=4ee2d632ccfd3d00ccfb7c0faf96639d0b47ec73")

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

sha256sums=('a82ab24dd79a80f1a98df4d7fd94009a70613d0ade77d3c6e8cd5a71e4f7757f')