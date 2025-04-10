
_pkgname=sdl3_shadercross
pkgname=$_pkgname-git
pkgver=r110.3e4431a
pkgrel=1
pkgdesc="Shader translation library for SDL's GPU API"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_shadercross"
license=('Zlib')
depends=('sdl3' 'spirv-cross' 'directx-shader-compiler')
options=(!debug)
makedepends=('cmake')
_pkgsrc="SDL_shadercross"
source=("${_pkgsrc}::git+$url.git"
#        "${_pkgsrc}-SPIRV-Cross::git+https://github.com/KhronosGroup/SPIRV-Cross.git"
#        "${_pkgsrc}-SPIRV-Headers::git+https://github.com/KhronosGroup/SPIRV-Headers.git"
#        "${_pkgsrc}-SPIRV-Tools::git+https://github.com/KhronosGroup/SPIRV-Tools.git"
#        "${_pkgsrc}-DirectXShaderCompiler::git+https://github.com/microsoft/DirectXShaderCompiler.git"
)
sha256sums=('SKIP'
#  'SKIP'
#  'SKIP'
#  'SKIP'
#  'SKIP'
)

provides=('sdl3_shadercross')
conflicts=('sdl3_shadercross')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgsrc"
 # git submodule update --init
}

build() {
  cmake -B build -S "$_pkgsrc" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DSDLSHADERCROSS_DXC=ON \
    -DSDLSHADERCROSS_INSTALL=ON \
    -DSDLSHADERCROSS_SHARED=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
