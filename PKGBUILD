# Maintainer: carstene1ns <arch carsten-teibes de>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

# based on cegui from Arch Linux repository, original credits go to:
#   Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
#   Contributor: Juergen Hoetzel <juergen@archlinux.org>
#   Contributor: William Rea <sillywilly@gmail.com>,
#   Contributor: Bjorn Lindeijer <bjorn@lindeijer.nl>

pkgname=cegui-0.7
pkgver=0.7.9
pkgrel=4
pkgdesc="A free library providing windowing and widgets for graphics APIs/engines (legacy version)"
arch=('i686' 'x86_64')
url="http://crayzedsgui.sourceforge.net"
license=("MIT")
depends=('glew' 'freetype2' 'libxml2' 'devil' 'freeglut' 'lua51' 'silly' 'mesa' 'glm' 'glfw')
makedepends=('python2' 'doxygen' 'gtk2' 'boost' 'graphviz') # 'ogre' 'irrlicht')
optdepends=("python2: python bindings"
            "boost-libs: null renderer with python2"
            #"ogre: ogre module"
            #"irrlicht: irrlicht module"
            "gtk2: gtk2 module")
provides=('cegui')
conflicts=('cegui')
options=('!libtool')
source=("http://downloads.sourceforge.net/crayzedsgui/CEGUI-$pkgver.tar.gz")
md5sums=('a8b682daf82e383edc169c2e6eb2b321')
sha256sums=('7c3b264def08b46de749c2acaba363e907479d924612436f3bd09da2e474bb8c')

build() {
  cd CEGUI-$pkgver

  ./bootstrap
  Lua_CFLAGS="$(pkg-config --cflags lua5.1)" \
  Lua_LIBS="$(pkg-config --libs lua5.1)" \
  PYTHON="/usr/bin/python2" ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-null-renderer --with-gtk2 --disable-samples \
    --disable-ogre-renderer --disable-irrlicht-renderer

  make
}

package() {
  cd CEGUI-$pkgver

  make DESTDIR="$pkgdir/" install

  install -Dm644 doc/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
