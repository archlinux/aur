# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: ying <Jinoto Systems>

pkgname=wallchange
pkgver=1.2
pkgrel=5
pkgdesc="A small and simple command tool which is changing the wallpaper on a switch to the next virtual desktop."
url="https://sourceforge.net/projects/wallchange-slim/files/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('hsetroot') # or 'eterm' (for esetroot) or feh or ... can be changed in any command tool to draw the wallpaper.
optdepends=('eterm' 'habak' 'feh') 
source=("https://downloads.sourceforge.net/project/wallchange-slim/wallchange-${pkgver}.tar.gz?r=&ts=1289391543&use_mirror=master" wallchange.conf)
sha256sums=('cac4fefdfae36b38a8b7ab49531b069288ca56069400ef65df402c8c5118d513'
            '87153974821cd4879e3fccf11745994c643d2c2d2712c91fa0546dfe64379625')

prepare() {
  # change the hardcoded Esetroot to hsetroot, as it is the cheaper
  # dependency under Arch Linux
  sed -i 's+Esetroot -s+hsetroot -fill+' ${srcdir}/${pkgname}-${pkgver}/main.cpp
}

build() {
  cd ${pkgname}-${pkgver}
  g++ -o ${pkgname} main.cpp -lX11
}

package() {
  install -Dm755 ${pkgname}-${pkgver}/wallchange \
	  "$pkgdir"/usr/bin/wallchange 
  install -Dm755 wallchange.conf \
	  "$pkgdir"/usr/share/wallchange/wallchange.conf 
}

