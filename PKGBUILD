# Maintainer: Ben Sutter <benjaminsutter@outlook.com>

pkgname=sbcl-git
pkgver=sbcl.2.2.9.r91.gd579e4a4f
pkgrel=1
pkgdesc="Steel Bank Common Lisp (Git snapshot)"
arch=('i686' 'x86_64' 'aarch64')
url="https://www.sbcl.org"
license=('BSD')
makedepends=('git' 'sbcl')
provides=("sbcl=$pkgver")
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

