# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>
# Contributor: egore911
# Contributor: Falcata
# Contributor: Jose Riha <jose1711 gmail com>

pkgname=caelum
pkgver=0.6.1
pkgrel=4
pkgdesc="Library for OGRE targeted to help create nice-looking atmospheric effects."
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/tikiwiki/Caelum"
depends=('ogre' 'cegui' 'doxygen' 'boost')
makedepends=('cmake')
provides=('caelum')
license=('LGPL')
source=("http://caelum.googlecode.com/files/caelum-${pkgver}.zip"
        "caelum-ogre-1.9.patch"
        "caelumplugin.patch")
sha512sums=('d1c6135f88491c3d45211de1652c0b11d8de30dbba8edeb440f52e35964be48b3cf45cfc4cfa926642b4d6e43751e4e449524046af21a2c3d1b20ae3576585f1'
            '3df2935c9191a7bf6a923edf09461379ee6a69370baba6b526e82d577821dafe28d3cc3ccaa949447ec32c625845bf39bebea076866530356ed4b712689b3c10'
            'b4306ad8402ed9e2619c77c671f62b89f6ce105109b10573abb0a1465d505938312561d46eda5ec3620435b6388a1476eb317c38e7d8aa3248e51b341645ed3e')

build() {
  cd ${srcdir}/caelum-${pkgver}
  patch -p0 < ${srcdir}/caelum-ogre-1.9.patch
  patch -p0 < ${srcdir}/caelumplugin.patch

  # get a clean build dir
  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd ${srcdir}/caelum-${pkgver}/build
  make DESTDIR=${pkgdir} install
}
