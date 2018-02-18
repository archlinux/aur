# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
# Maintainer: ZeroDot1 <zerodot1@bk.ru>
pkgname=mellowplayer
pkgver=3.3.4
pkgrel=1
pkgdesc="Open source and cross-platform desktop application that runs web-based music streaming 
         services in its own window and provides integration with your desktop."
url='https://github.com/ColinDuquesnoy/MellowPlayer'
license=('GPL')
arch=('x86_64')
depends=('qt5-base' 'qt5-webengine' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-translations' 'qt5-graphicaleffects' 'xdg-utils' 'libnotify' 'libevent')
makedepends=('qt5-tools' 'cmake')
optdepends=( 'qt5-webengine-widevine: DRM needed for Spotify' 'pepper-flash: needed for Tidal and Deezer')
source=("https://github.com/ColinDuquesnoy/MellowPlayer/archive/${pkgver}.tar.gz" 
        "widevine-path.patch")
md5sums=('f762c801c2a4f362cd4848850b0c266f'
         '67f8c5c6af4b770a4017a5ca9f137b90')

prepare() {
    cd $srcdir/MellowPlayer-${pkgver}
    patch -Np1 -i "${srcdir}/widevine-path.patch" "$srcdir/MellowPlayer-${pkgver}/src/main/share/applications/mellowplayer.desktop"
}

build() {
  cd $srcdir/MellowPlayer-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
  make 
}

package() {
  cd $srcdir/MellowPlayer-${pkgver}
  make DESTDIR=${pkgdir} install
}
