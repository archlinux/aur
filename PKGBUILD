# Mantainer: MCMic <come@chilliet.eu>

pkgname=wyrmsun
pkgver=3.5.4
pkgrel=1
pkgdesc="Real-time strategy game based on history, mythology and fiction"
arch=('i686' 'x86_64')
url="http://andrettin.github.io/"
license=('GPL' 'CC-BY-SA')
depends=('sdl' 'tolua++')
makedepends=('cmake')
source=("wyrmsun-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmsun/archive/v${pkgver}.tar.gz" 
        "wyrmgus-${pkgver}.tar.gz::https://github.com/Andrettin/Wyrmgus/archive/v${pkgver}.tar.gz"
        "oaml-1.0.tar.gz::https://github.com/marcelofg55/oaml/archive/v1.0.tar.gz")
md5sums=('c8b2b164b32ed4d9d43e86f57e20fb0a'
         '00d18754666b67aef97c11a01300584d'
	 '97019b32af9a809d812a457a97ed1344')
_name='Wyrmsun'
_categories='Game;StrategyGame'

prepare() {
  cp -a ${srcdir}/oaml-1.0/* ${srcdir}/Wyrmgus-${pkgver}/src/oaml/
}

build() {
  cd ${srcdir}/Wyrmgus-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_USEGAMEDIR=OFF .
  make
  cd ${srcdir}/Wyrmsun-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd ${srcdir}/
  mkdir -p ${pkgdir}/usr/bin/
  cd ${srcdir}/Wyrmgus-${pkgver}
  make DESTDIR="$pkgdir" install
  mv ${pkgdir}/usr/games/stratagus ${pkgdir}/usr/bin/wyrmgus
  cd ${srcdir}/Wyrmsun-${pkgver}
  make DESTDIR="$pkgdir" install
}
