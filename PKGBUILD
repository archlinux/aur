# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

pkgname=lib32-glu-git
pkgver=9.0.1
pkgrel=1
pkgdesc="Mesa OpenGL utility library (32 bits)"
arch=('x86_64')
url="https://mesa.freedesktop.org/"
license=('LGPL')
depends=('lib32-libgl' 'glu')
makedepends=('gcc-multilib' 'lib32-mesa')
provides=(lib32-glu)
conflicts=(lib32-glu)
source=("git+https://gitlab.freedesktop.org/mesa/glu.git")
sha256sums=('SKIP')
#validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # "Matt Turner <mattst88@gmail.com>"

pkgver() {
  cd glu
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd glu

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --disable-static --disable-debug \
    --libdir=/usr/lib32 
  make
}

#check() {
#  cd glu

#  export CC="gcc -m32"
#  export CXX="g++ -m32"
#  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

#  make -k check
#}

package() {
  cd glu

  make DESTDIR=${pkgdir} install
  
  rm -rf ${pkgdir}/usr/include
}
