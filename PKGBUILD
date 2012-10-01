# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>

pkgname=libquvi-scripts
pkgver=0.4.8
pkgrel=2
pkgdesc='Library for parsing video download links.'
arch=('any')
url='http://quvi.sourceforge.net/'
license=('LGPL')
depends=('curl' 'lua')
options=('!libtool')
source=("http://downloads.sourceforge.net/sourceforge/quvi/${pkgname}-${pkgver}.tar.gz"{,.sig}
        0001-Fix-youtube.lua.patch)
md5sums=('9a11cfcb474266b377ec41a5a502ffe0'
         '7126dbed0e493135089018775b1652a6'
         '0cdcda0fed2128c78c0c3ac784b94243')

build() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i ../0001-Fix-youtube.lua.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
