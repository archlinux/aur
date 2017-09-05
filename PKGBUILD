# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=xoutputd-git
_pkgname=xoutputd
pkgver=v0.1.r8.g98fff27
pkgrel=2
pkgdesc='Change screenlayout when connecting/disconnecting monitors'
arch=('any')
url="https://github.com/jlpc/xoutputd.git"
license=('MIT')
depends=('libx11' 'libxrandr')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/jlpc/xoutputd.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
  cd "$_pkgname"
  sed -i -e 's/-ll -ly/-lfl/' Makefile
  make PREFIX=/usr
}

package () {
  cd "$_pkgname"
  install -Dm755 xoutputd "${pkgdir}/usr/bin/xoutputd"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: et ts=2 sw=2
