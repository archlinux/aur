# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Kacper Piwiński <cosiekvfj@o2.pl>

pkgname=tgui
pkgver=1.13.0
pkgrel=1
pkgdesc="Cross-platform modern c++ GUI library"
arch=('i686' 'x86_64')
url="https://tgui.eu/"
license=('ZLIB')
depends=('sfml' 'sdl2' 'sdl2_ttf' 'glfw-x11' 'freetype2')
makedepends=('cmake' 'doxygen')

source=("https://github.com/texus/TGUI/archive/v${pkgver}.tar.gz")
sha256sums=('6e6000b5b130d6ddf73d593ff62cdd6f5c2045a1f8ffacb10262aedcb7ea7465')

build() {
  cd "${pkgname^^}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr . \
        -DCMAKE_BUILD_TYPE=RelWithDebugInfo \
        -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
        -DTGUI_CXX_STANDARD=17 \
        -DTGUI_BUILD_DOC=ON \
        -DTGUI_BUILD_GUI_BUILDER=ON \
        -DTGUI_BACKEND=Custom \
        -DTGUI_HAS_BACKEND_SFML_GRAPHICS=ON \
        -DTGUI_HAS_BACKEND_SFML_OPENGL3=ON \
        -DTGUI_HAS_BACKEND_SDL_RENDERER=ON \
        -DTGUI_HAS_BACKEND_SDL_OPENGL3=ON \
        -DTGUI_HAS_BACKEND_SDL_GLES2=ON \
        -DTGUI_HAS_BACKEND_SDL_TTF_OPENGL3=ON \
        -DTGUI_HAS_BACKEND_SDL_TTF_GLES2=ON \
        -DTGUI_HAS_BACKEND_GLFW_OPENGL3=ON \
        -DTGUI_HAS_BACKEND_GLFW_GLES2=ON
  make
}

package() {
  cd "${pkgname^^}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ./license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
