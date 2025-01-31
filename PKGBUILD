# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: uint2048_t

pkgname=pengupop
pkgver=2.2.6
pkgrel=1
pkgdesc="Clone of the retro arcade game Bust-a-move"
arch=('x86_64')
url='https://mirror.amdmi3.ru/distfiles/'
license=('GPL-3.0-only')
depends=('sdl')
source=("${url}/pengupop-${pkgver}.tar.gz")
sha256sums=('f6cef1fedb11bafc947f8824533df9ca9dd6aeaa5aa795c61870b986a1fc45ba')

prepare() {
  cd ${pkgname}-${pkgver}
  export CFLAGS="$CFLAGS -Wno-implicit-function-declaration"
  export CXXFLAGS="$CXXFLAGS -Wno-implicit-function-declaration"
  autoreconf -fi
  ./configure
}

build() { 
  cd ${pkgname}-${pkgver}
  make 
}

package() {
  cd ${pkgname}-${pkgver}
  make prefix="/usr" DESTDIR="${pkgdir}" install 
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 pengupop.desktop "${pkgdir}"/usr/share/applications/pengupop.desktop
  install -Dm644 pengupop.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/pengupop.png
}
