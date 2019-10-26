# Maintainer: fyr <wildefur@gmail.com>
pkgname=mmutils-git
pkgver=1.1.1.r4.g4beedf9
pkgrel=1
pkgdesc="A set of utilities for querying xrandr monitor information"
url="http://github.com/pockata/mmutils"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libxcb' 'xcb-util' 'xcb-util-wm' 'libwm-git')
makedepends=('git')
conflicts=()
source=("$pkgname::git+https://github.com/pockata/mmutils.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  prefix="/usr"
  manprefix="$prefix/share/man"
  licenseprefix="$prefix/share/licenses/$pkgname"
  docprefix="$prefix/share/doc/$pkgname"
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX="$prefix" MANPREFIX="$manprefix" install
}
