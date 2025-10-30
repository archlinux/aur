# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=electricsheep
pkgver=3.0.2
pkgrel=15
_gitcommit=d1cf1e1c40d8a8b7559e07798ce80ca79e0b3f18
pkgdesc='Screensaver that realize the collective dream of sleeping computers from all over the internet'
url='http://community.electricsheep.org/'
arch=('x86_64')
license=('GPL')
depends=('curl' 'flam3' 'ffmpeg' 'lua51' 'libgtop' 'boost-libs' 'freeglut' 'glee' 'wxwidgets-gtk3' 'tinyxml')
makedepends=('boost' 'mesa' 'glu')
optdepends=('xscreensaver: to use electricsheep with xscreensaver')
options=('!emptydirs')
source=(${pkgname}-${_gitcommit}.tar.gz::https://github.com/Rogach/electricsheep/archive/${_gitcommit}.tar.gz)
sha256sums=('fc5d2d59561130d334482a1fbc58e950d2e18ca90ade1fb03a07f4d7fdaa03bd')

prepare() {
  cd ${pkgname}-${_gitcommit}/client_generic
  install -d m4
  ./autogen.sh
}

build() {
  cd ${pkgname}-${_gitcommit}/client_generic
  ./configure --prefix=/usr
  make CXXFLAGS+="-DGL_GLEXT_PROTOTYPES" GLEE_LIBS="-lGLee" LDFLAGS+="-lpthread"
}

package() {
  cd ${pkgname}-${_gitcommit}/client_generic
  make DESTDIR="${pkgdir}" install
  install -Dm 644 menu-entries/ElectricSheep.desktop.kde "${pkgdir}/usr/share/kde4/services/ScreenSavers/electricsheep.desktop"
  install -Dm 644 Runtime/logo.png "${pkgdir}/usr/share/icons/electricsheep.png"
}

# vim: ts=2 sw=2 et:
