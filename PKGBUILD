# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=cegui-git
pkgver=r6347.e444e854e
pkgrel=2
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines"
arch=('i686' 'x86_64')
url="http://cegui.org.uk"
license=("MIT")
depends=(glm)
makedepends=('git' 'cmake' 'swig')
optdepends=('pcre'
            'freetype2'
            'minizip'
            'fribidi'
            'libraqm'
            'freeglut'
            'mesa'
            'glew'
            'glfw'
            'sdl2'
            'sdl2_image'
            'sfml'
            'irrlicht'
            'ogre'
            'boost'
            'ois'
            'directfb'
            'libepoxy'
            'expat'
            'libxml2'
            'tinyxml'
            'tinyxml2'
            'rapidxml'
            'devil'
            'freeimage'
            'silly'
            'lua51'
            'tolua++'
            'python'
            'doxygen'
            'gtk2'
            'ccache')
provides=('cegui')
conflicts=('cegui')
_pkgname=cegui
source=("${_pkgname}::git+https://github.com/cegui/cegui")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

    mkdir -p "$srcdir/${_pkgname}/build"
    cd "$srcdir/${_pkgname}/build"

    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr

    make
}

package() {
    cd "$srcdir/${_pkgname}/build"
    make DESTDIR=${pkgdir} install

    install -Dm644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
