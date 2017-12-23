# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=fmt-git
pkgver=4.1.1.r2374.3193460
pkgrel=1
pkgdesc='An open-source formatting library for C++'
url='http://fmtlib.net'
arch=('i686' 'x86_64')
license=('BSD')
makedepends=('git' 'cmake>=2.8.12')
conflicts=('fmt')
provides=('fmt')
source=('git://github.com/fmtlib/fmt.git')
sha512sums=('SKIP')

pkgver() {
  mkdir -p build
  cd build
  version=$(cmake ../fmt -DFMT_DOC=OFF -DFMT_TEST=OFF -DBUILD_SHARED_LIBS=TRUE -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_PREFIX=/usr | grep Version | cut -d ' ' -f3)
  cd ../fmt
  echo "${version}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd build
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 fmt/LICENSE.rst ${pkgdir}/usr/share/licenses/fmt-git/LICENSE.rst
}
