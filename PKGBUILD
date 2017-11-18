# Contributor: Artem Vorotnikov <artem@vorotnikov.me>

pkgname=caelum-ogre1.9
pkgver=0.6.3
pkgrel=2
pkgdesc="Library for OGRE targeted to help create nice-looking atmospheric effects."
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/tikiwiki/Caelum"
depends=('ogre-1.9' 'cegui-0.7' 'doxygen' 'boost')
makedepends=('cmake')
provides=('caelum')
license=('LGPL')
source=("https://github.com/RigsOfRods/ogre-caelum/archive/v0.6.3.tar.gz")

sha512sums=('f415810932c56521369fe5b12d151159ca73486dad415df7c3ae2e10dea81de28fe28bb81b731282f22c8049707c0ea72870b06bdc627f205280cf8d0f1db14d')

build() {
  export PKG_CONFIG_PATH="/opt/OGRE-1.9/lib/pkgconfig"

  cd ${srcdir}/ogre-caelum-${pkgver}

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  CXXFLAGS+=' -std=gnu++98'

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/opt/Caelum-OGRE1.9/

  make 
}

package() {
  cd ${srcdir}/ogre-caelum-${pkgver}/build
  make DESTDIR=${pkgdir} install
}
