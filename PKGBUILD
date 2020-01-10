# Maintainer: HanFox <han@hanfox.co.uk>
# Based on the 'community/openttd' PKGBUILD by: Vesa Kaihlavirta <vegai@iki.fi>

pkgname=openttd-jgrpp
pkgver=0.33.0
pkgrel=1
pkgdesc="OpenTTD with JGR's patch pack."
arch=('i686' 'x86_64')
url='http://www.tt-forums.net/viewtopic.php?f=33&t=73469'
license=('GPL')
depends=('libpng' 'sdl' 'icu' 'fontconfig' 'lzo' 'hicolor-icon-theme' 'desktop-file-utils' 'tar' 'fluidsynth')
source=("https://github.com/JGRennison/OpenTTD-patches/archive/jgrpp-${pkgver}.tar.gz")
sha256sums=('f7622814706ba85a66dff42803e184adf3d32f330f506addf95691dec8aa1f45')

_dirname=OpenTTD-patches-jgrpp

build() {
  cd ${_dirname}-${pkgver} 
  
 ./configure \
    --prefix-dir=/usr \
    --binary-name=${pkgname} \
    --binary-dir=bin \
    --data-dir=share/${pkgname} \
    --install-dir="${pkgdir}" \
    --doc-dir=share/doc/${pkgname} \
    --with-fluidsynth \
    --menu-name="OpenTTD (JGR Patch Pack)" \
    --personal-dir=.${pkgname}

  make
}

package() {
  cd ${_dirname}-${pkgver}
  
  mkdir -p ${pkgdir}/usr/share/${pkgname}/{data,game}

  make install
} 
