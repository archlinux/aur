# Maintainer: Fangrui Song <i at maskray.me>

pkgname=ccls
pkgver=0.20180513
pkgrel=1
pkgdesc='C/C++/ObjC language server supporting cross references, hierarchies, completion and semantic highlighting'
arch=('any')
url='https://github.com/MaskRay/ccls'
license=('MIT')
depends=('clang' 'llvm')
makedepends=("cmake" "git")
conflicts=('ccls-git')
source=("https://github.com/MaskRay/$pkgname/archive/$pkgver.tar.gz"
        'git+https://github.com/miloyip/rapidjson'
        'git+https://github.com/onqtam/doctest'
        'git+https://github.com/emilk/loguru'
        )
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd $pkgname-$pkgver
  cp -r $srcdir/rapidjson third_party
  cp -r $srcdir/doctest third_party
  cp -r $srcdir/loguru third_party
}

build() {
  cd $pkgname-$pkgver
  cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DSYSTEM_CLANG=On
  cmake --build build
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
