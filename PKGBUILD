# Maintainer:
# Contributor: kevku <kevku@gmx.com>

pkgname=libxsd
pkgver=4.2.0
pkgrel=1
pkgdesc='An open-source, cross-platform W3C XML Schema to C++ data binding compiler (runtime library)'
arch=(any)
url='https://www.codesynthesis.com/products/xsd'
license=(GPL2)
makedepends=(build2)
source=(https://www.codesynthesis.com/download/xsd/${pkgver%.*}/$pkgname-$pkgver.tar.gz)
sha256sums=('55caf0038603883eb39ac4caeaacda23a09cf81cffc8eb55a854b6b06ef2c52e')

build() {
  bpkg create -d build cc          \
    config.cxx=g++                 \
    config.cc.coptions="${CFLAGS}"
  cd build
  bpkg add "$srcdir"/$pkgname-$pkgver --type dir
  bpkg rep-fetch
  bpkg build libxsd
}

package() {
  cd build
  bpkg install config.install.root="$pkgdir"/usr libxsd
}
