# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=f3-git
_pkgname=f3
pkgver=7.1.r13.gfead723
pkgrel=1
pkgdesc="F3 - Fight Flash Fraud"
arch=('x86_64')
url="http://oss.digirati.com.br/f3/"
license=('GPL3')
depends=('systemd-libs' 'parted')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/AltraMayor/f3.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
  make extra
}

package() {
  cd "$_pkgname"
  make PREFIX="$pkgdir/usr" install
  make PREFIX="$pkgdir/usr" install-extra
}

# vim:set ts=8 sts=2 sw=2 et:
