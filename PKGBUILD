#_                   _ _ _  _ _____ _  _
#| | _______   ____ _| | | || |___  | || |
#| |/ / _ \ \ / / _` | | | || |_ / /| || |_
#|   <  __/\ V / (_| | | |__   _/ / |__   _|
#|_|\_\___| \_/ \__,_|_|_|  |_|/_/     |_|

#Maintainer: kevall474 <kevall474@tuta.io> <https://github.com/kevall474>
#Credits: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=openmp-stable
pkgdesc='LLVM OpenMP Runtime Library'
url='https://openmp.llvm.org/'
pkgver=12.0.0
pkgrel=1
arch=('x86_64')
license=('custom:Apache 2.0 with LLVM Exception')
depends=('glibc' 'libelf' 'libffi')
makedepends=('cmake' 'ninja')
conflicts=('openmp' 'openmp-git' 'openmp-rc')
provides=('openmp')
source=("https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/llvm-project-$pkgver.src.tar.xz")
md5sums=('SKIP')

build(){
  cd llvm-project-$pkgver.src/openmp

  rm -rf build

  cmake -H. -G Ninja -Bbuild \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DLIBOMP_INSTALL_ALIASES=OFF

  ninja -C build
}

package(){
  cd llvm-project-$pkgver.src/openmp

  DESTDIR="$pkgdir" ninja -C build/ install

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rm "$pkgdir/usr/lib/libarcher_static.a"
}
