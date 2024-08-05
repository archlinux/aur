# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=pdfio
pkgname=$_pkgname-git
pkgver=1.3.0.r0.g0c1122b
pkgrel=2
pkgdesc="A simple C library for reading and writing PDF files"
arch=('x86_64')
url="https://www.msweet.org/pdfio/"
license=('Apache-2.0 WITH LLVM-exception AND BSD-3-Clause AND Zlib AND BSD-2-Clause')
depends=('zlib')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/michaelrsweet/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  ./configure --prefix=/usr --enable-shared
}

build() {
  cd $_pkgname
  make all
}

check() {
  cd $_pkgname
  make test
}

package() {
  cd $_pkgname
  make BUILDROOT="${pkgdir}" install
  install -d "${pkgdir}"/usr/share/licenses/$pkgname
  rm "${pkgdir}"/usr/share/doc/$_pkgname/LICENSE
  mv "${pkgdir}"/usr/share/doc/$_pkgname/NOTICE "${pkgdir}"/usr/share/licenses/$pkgname/
}
