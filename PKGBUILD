# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Oskar Sveinsen
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>

pkgname=cegui
pkgver=0.8.7
pkgrel=11
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines"
arch=('i686' 'x86_64')
url="http://cegui.org.uk"
license=("MIT")
depends=('pcre' 'glew' 'expat' 'freetype2' 'libxml2' 'devil' 'freeglut' 'lua51'
         'silly')
makedepends=('cmake' 'python2' 'doxygen' 'ogre=1.9' 'gtk2' 'boost' 'graphviz'
             'irrlicht' 'glm' 'mesa' 'tolua++' 'mercurial' 'ois')
optdepends=('ogre: ogre module'
            'python2: python bindings'
            'ois: running samples'
            'gtk2: gtk2 module'
            'irrlicht: irrlicht module')
_pkgver=0-8-7
source=("${pkgname}-${pkgver}::https://github.com/cegui/cegui/archive/v${_pkgver}.tar.gz")
sha256sums=('7be289d2d8562e7d20bd155d087d6ccb0ba62f7e99cc25d20684b8edf2ba15cd')

prepare() {
    # Ensure libraries are installed in lib
    sed -i 's/lib64/lib/g' ${srcdir}/${pkgname}-${_pkgver}/CMakeLists.txt
}

build() {
  mkdir -p "${srcdir}/${pkgname}-${_pkgver}/build"
  cd "${srcdir}/${pkgname}-${_pkgver}/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCEGUI_BUILD_XMLPARSER_LIBXML2=OFF \
        -DCEGUI_BUILD_LUA_MODULE=OFF \
        -DCEGUI_BUILD_LUA_GENERATOR=OFF \
        ..

  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  make DESTDIR="${pkgdir}/" install

  install -Dm644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
