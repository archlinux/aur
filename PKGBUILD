# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>
# Maintainer: Feng Wang <wanng.fenng AT gmail DOT com>
pkgname=gmm
pkgver=5.1
pkgrel=3
pkgdesc="Generic C++ finite element library"
arch=('i686' 'x86_64')
url="http://getfem.org/"
license=('LGPL')
source=("http://download-mirror.savannah.gnu.org/releases/getfem/stable/${pkgname}-${pkgver}.tar.gz")
sha256sums=('90e6bf309b81f496b401a375fe99826ad4b5c6ba99db6c92b37f9261db462636')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i "s/-ftemplate-depth-40/-ftemplate-depth=1024/" configure
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr

  make
}

check(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

