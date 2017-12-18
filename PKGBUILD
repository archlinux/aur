# Maintainer: Colin Duquesnoy <colin.duquesnoy@gmail.com>
# Maintainer: ZeroDot1 <zerodot1@bk.ru>
pkgname=mellowplayer
pkgver=3.2.0
pkgrel=2
pkgdesc="Open source and cross-platform desktop application that runs web-based music streaming 
         services in its own window and provides integration with your desktop."
url='https://github.com/ColinDuquesnoy/MellowPlayer'
license=('GPL')
arch=('x86_64')
depends=('qt5-base' 'qt5-webengine' 'qt5-svg' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-translations' 'qt5-graphicaleffects' 'xdg-utils' 'libnotify' 'libevent')
makedepends=('qt5-tools' 'cmake')
optdepends=( 'qt5-webengine-widevine: widevine DRM plugin' 'pepper-flash: needed for Deezer and Spotify')
source=("https://github.com/ColinDuquesnoy/MellowPlayer/archive/${pkgver}.tar.gz" 
        "widevine-path.patch")
md5sums=('3b139359978faed0282328b7edc545ea'
         '67f8c5c6af4b770a4017a5ca9f137b90')
         
prepare() {
    cd $srcdir/MellowPlayer-${pkgver}
    patch -Np1 -i "${srcdir}/widevine-path.patch" "$srcdir/MellowPlayer-${pkgver}/src/share/applications/mellowplayer.desktop"
}

build() {
  cd $srcdir/MellowPlayer-${pkgver}

  # patch -Np1 -i "${srcdir}/eject.patch"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -Wno-dev
  make 
}

package() {
  cd $srcdir/MellowPlayer-${pkgver}

  make DESTDIR=${pkgdir} install
}
