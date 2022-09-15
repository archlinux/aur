###PKGBUILD was last modified on September 15, 2022 at 12:28 AM EDT by bms### 

# Maintainer: Gary Hollis <ghollisjr@gmail.com>

pkgname=sbcl-git
pkgver=sbcl.2.2.8.r94.g70c277589
pkgrel=1
pkgdesc="Steel Bank Common Lisp from Git"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.sbcl.org"
license=('BSD')
makedepends=('texlive-bin' 'sbcl')
provides=(sbcl)
conflicts=(sbcl)
BUILDENV+=('!check')
source=("$pkgname::git+git://git.code.sf.net/p/sbcl/sbcl")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  sh make.sh --fancy
  cd doc/manual && make
}

check() {
  cd "$pkgname/tests" && sh run-tests.sh
}

package() {
  cd "$pkgname"
  INSTALL_ROOT="$pkgdir/usr" ./install.sh
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

