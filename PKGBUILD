# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Scott Smith <jcdenton513 gmail com>
pkgname=veracity
pkgver=2.5.0
_series=release # release or nightly
_verextra=11065
pkgrel=1
pkgdesc="A new open source distributed version control system."
url="http://www.veracity-scm.com"
arch=('x86_64' 'i686')
license=('APACHE')
depends=('curl' 'icu' 'js')
optdepends=('libgnome-keyring: for remembering authentication credentials')
makedepends=('cmake' 'unzip')
install="veracity.install"
options=(!makeflags)
source=("http://download.sourcegear.com/Veracity/$_series/$pkgver.$_verextra/veracity-source-$pkgver.$_verextra.tar.gz")
sha256sums=('a6e9f0bb1215d9730fa95d65d528e60085ac8b64d18307c5038b526cd78636a2')
 
build() {
  cd "$srcdir"
  rm -rf build
  mkdir build
  cd build

  cmake -G "Unix Makefiles" \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    ../$pkgname
  make rebuild_cache
  make
}

check() {
  cd "$srcdir"/build

  make test
}

package() {
  cd "$srcdir"/build

  make DESTDIR="${pkgdir}" install
}

