pkgname=glslang-git
pkgver=8.13.3743.3.gf03cb290
pkgrel=1
pkgdesc='Front end for GLSL/ESSL, HLSL, and a SPIR-V generator, git version'
arch=('x86_64' 'i686')
url='http://www.khronos.org/opengles/sdk/tools/Reference-Compiler'
license=('GPL')
depends=('gcc-libs')
makedepends=('cmake' 'git')
provides=('glslang')
conflicts=('glslang')
source=("git://github.com/KhronosGroup/glslang.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --tags --exclude master-tot | sed -e 's:v::' -e 's/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  cmake --install . -v --strip --prefix "$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:
