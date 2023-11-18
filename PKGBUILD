# Maintainer: oysstu <oysstu at gmail dot com>
# Contributor: Tolga Hosgor <fasdfasdas@gmail.com>

_pkgname=('ogre-next')
pkgname=("gz-$_pkgname")
pkgver=2.3.3
pkgrel=1
pkgdesc='Scene-oriented, flexible 3D engine written in C++. Gazebo compatible.'
arch=('any')
url='http://ogre3d.org'
license=('MIT')
depends=(
  'freeimage'
  'freetype2'
  'glu'
  'libxaw'
  'libxrandr'
  'rapidjson'
  'tinyxml'
  'zziplib'
  'sdl2'
  'zlib'
)
makedepends=(
  'cmake'
  'mesa'
  'vulkan-headers'
)
provides=('ogre-next')
source=("https://github.com/OGRECave/$_pkgname/archive/v${pkgver}.tar.gz")
sha256sums=('92ce7765d892d6424df3d8d4a56a8fc0b2f4f91c216b1b1d5b231caa9abaaa38')

_build_dir="$_pkgname-${pkgver}/build"

build() {
  mkdir -p "$srcdir/$_build_dir" && cd $_
  cmake ..  -DCMAKE_BUILD_TYPE='Release' \
            -DCMAKE_INSTALL_PREFIX=/usr \
            -DOGRE_CONFIG_ENABLE_JSON:BOOL=TRUE \
            -DOGRE_CONFIG_ENABLE_ZIP:BOOL=TRUE \
            -DOGRE_CONFIG_ENABLE_FREEIMAGE:BOOL=TRUE \
            -DOGRE_CONFIG_THREADS=1 \
            -DOGRE_CONFIG_THREAD_PROVIDER="std" \
            -DOGRE_BUILD_COMPONENT_PLANAR_REFLECTIONS:BOOL=TRUE \
            -DOGRE_BUILD_COMPONENT_PROPERTY:BOOL=FALSE \
            -DOGRE_BUILD_COMPONENT_SCENE_FORMAT:BOOL=TRUE \
            -DOGRE_BUILD_COMPONENT_HLMS_PBS:BOOL=TRUE \
            -DOGRE_BUILD_COMPONENT_HLMS_UNLIT:BOOL=TRUE \
            -DOGRE_BUILD_COMPONENT_MESHLODGENERATOR:BOOL=TRUE \
            -DOGRE_BUILD_COMPONENT_OVERLAY:BOOL=TRUE \
            -DOGRE_BUILD_RENDERSYSTEM_GL3PLUS:BOOL=TRUE \
            -DOGRE_BUILD_RENDERSYSTEM_VULKAN:BOOL=TRUE \
            -DOGRE_BUILD_TESTS:BOOL=FALSE \
            -DOGRE_BUILD_SAMPLES2:BOOL=FALSE \
            -DOGRE_INSTALL_SAMPLES_SOURCE:BOOL=FALSE \
            -DOGRE_INSTALL_DOCS:BOOL=FALSE \
            -DOGRE_INSTALL_SAMPLES:BOOL=FALSE \
            -DOGRE_USE_NEW_PROJECT_NAME:BOOL=TRUE \
            -DOGRE_USE_BOOST:BOOL=FALSE

  cmake --build .
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_build_dir"
}
