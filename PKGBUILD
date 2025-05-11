# Maintainer: waterlubber <waterlubber42 at gmail dot com>
pkgname=intel-level-zero-raytracing-support-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r150.git.3f30b62
pkgrel=1
pkgdesc="Intel OneAPI Raytracing Support"
arch=('x86_64')
url="https://github.com/intel/level-zero-raytracing-support"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cmake')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=("git+https://github.com/intel/level-zero-raytracing-support.git")
sha256sums=('SKIP')


pkgver() {
  cd "$srcdir/level-zero-raytracing-support"
  printf "r%s.git.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cmake -B build -S "level-zero-raytracing-support" \
  -G Ninja -D CMAKE_CXX_COMPILER=g++ -D CMAKE_C_COMPILER=gcc -D CMAKE_BUILD_TYPE=Release \
  -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
  cmake --build build --target package
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
