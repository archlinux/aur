# Maintainer: Sandy Carter <bwrsandman at gmail dot com>
# Contributor: Daniel Kirchner <daniel at ekpyron dot org>

pkgname=mingw-w64-glm
# x because this does not need updating with new versions, depends on glm package
pkgver=0.9.x
pkgrel=4
pkgdesc="C++ mathematics library for 3D software based on the OpenGL Shading Language (GLSL) specification. (mingw-w64 symlinks)"
arch=('any')
license=('GPL')
url="http://glm.g-truc.net"
depends=('glm' 'mingw-w64-crt')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
    mkdir -p "${pkgdir}/usr/${_arch}/include"
    ln -s /usr/include/glm "${pkgdir}/usr/${_arch}/include"
    mkdir -p "${pkgdir}/usr/${_arch}/lib/cmake/glm"
    # symlink the cmake files instead of the folder because they are not symlink agnostic
    ln -s /usr/lib/cmake/glm/* "${pkgdir}/usr/${_arch}/lib/cmake/glm"
  done
}
