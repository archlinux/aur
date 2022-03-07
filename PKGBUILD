# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail.com>

pkgname=fsqlf-git
_pkgname=fsqlf
pkgver=v1.0.0.prealpha.02.r21
pkgrel=1
pkgdesc="Free SQL Formatter which adds linebreaks and indentation to SQL source code"
arch=('i686' 'x86_64')
url="http://fsqlf.sourceforge.net/"
license=('LGPL')
depends=('wxgtk2')
makedepends=('flex' 'gcc' 'make' 'git')
source=("git+https://github.com/dnsmkl/fsqlf.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r 's/([^-]*)-g.*/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  rm -rf build
  mkdir -p build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make "DESTDIR=${pkgdir}" install
}
