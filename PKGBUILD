# Maintainer: Fangrui Song <i at maskray.me>

pkgname=ccls
pkgver=0.20181111.1
pkgrel=1
pkgdesc='C/C++/ObjC language server supporting cross references, hierarchies, completion and semantic highlighting'
arch=('any')
url='https://github.com/MaskRay/ccls'
license=('Apache')
depends=('clang' 'llvm')
makedepends=("cmake" "git" "llvm")
conflicts=('ccls-git')
source=("https://github.com/MaskRay/$pkgname/archive/$pkgver.tar.gz"
        'git+https://github.com/Tencent/rapidjson'
        )
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd $pkgname-$pkgver
  cp -r $srcdir/rapidjson third_party
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
