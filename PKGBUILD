# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=cegui-git
pkgver=r6342.d313d6fbc
pkgrel=1
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines"
arch=('i686' 'x86_64')
url="http://cegui.org.uk"
license=("MIT")
depends=('pcre' 'glew' 'expat' 'freetype2' 'libxml2' 'devil' 'freeglut' 'lua51'
         'silly')
makedepends=('cmake' 'python2' 'doxygen' 'ogre' 'gtk2' 'boost' 'graphviz'
             'irrlicht' 'glm' 'mesa' 'tolua++' 'mercurial' 'ois')
optdepends=('ogre: ogre module'
            'python2: python bindings'
            'ois: running samples'
            'gtk2: gtk2 module'
            'irrlicht: irrlicht module')
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
