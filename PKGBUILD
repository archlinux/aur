# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: ying <Jinoto Systems>

pkgname=wallchange
pkgver=1.2
pkgrel=3
pkgdesc="A small and simple command tool which is changing the wallpaper on a switch to the next virtual desktop."
url="https://sourceforge.net/projects/wallchange-slim/files/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('habak') # or 'eterm' (for esetroot) or feh or ... can be changed in any command tool to draw the wallpaper.
optdepends=('eterm' 'habak' 'feh' 'hsetroot')
source=("https://downloads.sourceforge.net/project/wallchange-slim/wallchange-${pkgver}.tar.gz?r=&ts=1289391543&use_mirror=master" wallchange.conf)
md5sums=('840425f1c724aea198b7cd378fba708d'
         'd4a9b5c9b341eee1651269139e1f91c9')

prepare() {
  # change the hardcoded Esetroot to habak, as it is the cheaper
  # dependency under Arch Linux
  sed -i 's+Esetroot -s+habak -mC -mS+' ${srcdir}/${pkgname}-${pkgver}/main.cpp
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  g++ -o ${pkgname} main.cpp -lX11
}

package() {
  install -Dm755 ${pkgname}-${pkgver}/wallchange \
	  $pkgdir/usr/bin/wallchange 
  install -Dm755 wallchange.conf \
	  $pkgdir/usr/share/wallchange/wallchange.conf 
}

