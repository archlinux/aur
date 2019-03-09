# Maintainer: Fangrui Song <i at maskray.me>

pkgname=ccls
pkgver=0.20190308
pkgrel=1
pkgdesc='C/C++/ObjC language server supporting cross references, hierarchies, completion and semantic highlighting'
arch=('x86_64')
url='https://github.com/MaskRay/ccls'
license=('Apache')
depends=('clang' 'llvm-libs' 'rapidjson')
makedepends=("cmake" "git" "llvm")
conflicts=('ccls-git')
source=("https://github.com/MaskRay/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  cmake -H. -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DSYSTEM_CLANG=on -DUSE_SHARED_LLVM=on -DLLVM_ENABLE_RTTI=on
  cmake --build build
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
