# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Tolga Cakir <tolga@cevel.net>

_pkgname=sidewinderd
pkgname=$_pkgname-git
pkgver=0.4.0.r1.gb167c93
pkgrel=1
pkgdesc="Support for Microsoft SideWinder X4 / X6 and Logitech G105 / G710+."
arch=('x86_64')
url="http://cevel.net/projects/sidewinderd/"
depends=('libconfig' 'systemd' 'tinyxml2')
makedepends=('cmake' 'git')
conflicts=("$_pkgname")
provides=("$_pkgname")
license=('MIT')
install=$pkgname.install
source=("git+https://github.com/tolga9009/sidewinderd.git")
sha512sums=('SKIP')
backup=('etc/sidewinderd.conf')

pkgver() {
  cd $srcdir/$_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ../$_pkgname
}

build() {
  cd build
  make
}

package() {
  cd build
  make DESTDIR=$pkgdir install

  install -Dm644 $srcdir/$_pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
