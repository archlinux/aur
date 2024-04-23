# Maintainer: Chih-Hsuan Yen <base64_decode("eWFuMTIxMjUgQVQgYXJjaGxpbnV4IERPVCBvcmc=")>
# Co-Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=qtxdg-tools
pkgname=$_pkgname-git
pkgver=4.0.0
pkgrel=1
pkgdesc="User tools for libqtxdg"
arch=("x86_64")
url="https://lxqt-project.org"
license=("LGPL-2.1-only")
depends=('libqtxdg-git')
makedepends=('git' 'cmake' 'lxqt-build-tools-git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/lxqt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed "s/-/.r/;s/-/./"
}

build() {
  cmake -B build -S "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
