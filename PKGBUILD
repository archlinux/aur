# Maintainer: Mischa Alff <aster@is.a.cxx.ninja>
# Contributors: Malet <malet@gmx.at>
pkgname=vera++
pkgver=1.3.0
pkgrel=1
pkgdesc="A programmable tool for verification, analysis and transformation of C++ source code"
arch=(i686 x86_64)
url="https://bitbucket.org/verateam/vera"
license=('custom:boost')
depends=('sh' 'gcc-libs' 'tcl' 'boost' 'lua51' 'luabind-git' 'python')
makedepends=('cmake')
source=(
  https://bitbucket.org/verateam/vera/downloads/$pkgname-$pkgver.tar.gz
  gcc51.patch::https://bitbucket.org/verateam/vera/commits/79f899a98596bae7fa5af04decac15d0600c8cfa/raw/
)

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/gcc51.patch"
}

build() {
  cd "$pkgname-$pkgver"

  mkdir -p build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DLUA_INCLUDE_DIR=/usr/include/lua5.1

  make
}

package() {
  cd "$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir" install
}

md5sums=('f702f0e99253c7410a02029e185df0a7'
         '665e0442cc416936f94cf79ef67725aa')
