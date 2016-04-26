# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=xoutputd-git
_pkgname=xoutputd
pkgver=v0.1.r0.gc7ac198
pkgrel=1
pkgdesc='Change screenlayout when connecting/disconnecting monitors'
arch=('any')
url="https://github.com/jlpc/xoutputd.git"
license=('MIT')
makedepends=('libx11' 'libxrandr' 'flex')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/jlpc/xoutputd.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  sed -i -e 's/-ll -ly/-lfl/' ${srcdir}/${_pkgname}/Makefile
  make -C "$srcdir/$_pkgname" PREFIX=/usr
}

package () {
  install -Dm655 "${srcdir}/${_pkgname}/xoutputd" "${pkgdir}/usr/bin/xoutputd"
}

# vim: et ts=2 sw=2
