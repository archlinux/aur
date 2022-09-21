###PKGBUILD was last modified on September 15, 2022 at 02:30 PM EDT by bms### 

# Maintainer: Ben Sutter <benjaminsutter@outlook.com>

pkgname=sbcl-git
pkgver=sbcl.2.2.8.r129.g2a5fc6359
pkgrel=1
pkgdesc="Steel Bank Common Lisp from Git"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.sbcl.org"
license=('BSD')
makedepends=('git' 'sbcl')
provides=("sbcl=$pkgver")
conflicts=(sbcl)
BUILDENV+=('!check')
source=("${pkgname%-git}::git+git://git.code.sf.net/p/sbcl/sbcl")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  sh make.sh --fancy
}

check() {
  cd "${pkgname%-git}/tests" && sh run-tests.sh
}

package() {
  cd "${pkgname%-git}"
  INSTALL_ROOT="$pkgdir/usr" ./install.sh
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname%-git}/COPYING"
}

