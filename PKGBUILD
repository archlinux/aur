# Maintainer: GI_Jack <GI_Jack@hackermail.com>

# Original Work
#	Joe Davison <joe@warhaggis.com>
#	Felix Golatofski <contact@xdfr.de>
#	zer0def <zer0def on freenode>

pkgname=libpurple-signald
pkgver=0.12.1
pkgrel=1
pkgdesc='Pidgin libpurple bridge to signald.'
url='https://github.com/hoehermann/libpurple-signald'
license=('GPL3')
arch=('any')
conflicts=('libpurple-signald-git')
depends=('json-glib' 'libpurple' 'signald' 'qrencode')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hoehermann/libpurple-signald/archive/v${pkgver}.tar.gz")
sha256sums=('1832558e5750c8dc89ca35dde0f524f0d463fc8f68d8ab7daf26fb7bf8e694ea')

prepare(){
  cd "${srcdir}/purple-signald-${pkgver}"
  cd submodules
  git clone -n https://github.com/trumpowen/MegaMimes/
  cd MegaMimes
  git checkout b839068db99cbfcff1af8df1229bd7e41701fe96
  cd ..
  git clone -n https://github.com/nayuki/QR-Code-generator/
  cd QR-Code-generator
  git checkout 4e41cb2c721a5e06eff75e79fd47a4274f6bb8b0
}

build() {
  cd "${srcdir}/purple-signald-${pkgver}"
  mkdir build
  cd build
  cmake ..
  make
}

package() {
  cd "${srcdir}/purple-signald-${pkgver}"
  cd build
  make DESTDIR="${pkgdir}" install
}

