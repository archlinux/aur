# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=fbx-conv-git
pkgver=r173.6dd9f6a
pkgrel=1
pkgdesc="Command line utility using the FBX SDK to convert FBX/Collada/Obj files to a custom text/binary format for static, keyframed and skinned meshes."
arch=('i686' 'x86_64')
url="https://github.com/libgdx/fbx-conv"
license=('apache')
depends=('fbx-sdk' 'gcc-libs')
makedepends=('git' 'premake')
source=('fbx-conv::git+https://github.com/libgdx/fbx-conv.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  unset LDFLAGS
  unset CXXFLAGS
  unset CPPFLAGS
  unset CFLAGS
  unset MAKEFLAGS
  FBX_SDK_ROOT="/usr" ./generate_makefile
  cd build/gmake
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -D fbx-conv "$pkgdir/usr/bin/fbx-conv"
}

