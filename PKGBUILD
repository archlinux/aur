# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=cpp-utilities
pkgname=c++utilities
pkgver=4.9.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Common C++ classes and routines such as argument parser, IO and conversion utilities'
license=('GPL')
depends=()
optdepends=("$pkgname-doc: API documentation")
makedepends=('cmake')
checkdepends=('cppunit')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz"
        "Make-check-for-fromTimeStamp-timezone-independent.patch::https://github.com/Martchus/${_reponame}/commit/f2189a15cea404532c47744fae4799c7aba2dba8.patch")
sha256sums=('b04bcb29c3dcb2ab63b76b9bc2d1f27022826dc9db387745b06c278b27b1faec'
            '7a7161e01248a6026f5a8016f1f83b0c7a95d128493a67314a87b1eac5fcaa35')

prepare() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  patch -p1 -i "$srcdir/Make-check-for-fromTimeStamp-timezone-independent.patch"
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make check
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  make DESTDIR="${pkgdir}" install
}
