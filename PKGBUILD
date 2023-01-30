# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=electricsheep
pkgver=3.0.2
pkgrel=12
_gitcommit=0a2c437052ba166ce2081894d9bf63b2b2e0134b
pkgdesc='Screensaver that realize the collective dream of sleeping computers from all over the internet'
url='http://community.electricsheep.org/'
arch=('x86_64')
license=('GPL')
depends=('curl' 'flam3' 'ffmpeg' 'lua51' 'libgtop' 'boost-libs' 'freeglut' 'glee' 'wxwidgets-gtk3' 'tinyxml')
makedepends=('boost' 'mesa' 'glu')
optdepends=('xscreensaver: to use electricsheep with xscreensaver')
options=('!emptydirs')
source=(${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/Rogach/electricsheep/archive/${_gitcommit}.tar.gz)
sha256sums=('38bb90b4d4cf7d6285c35d4b8fd134f841d70c5ab0f2add19048c21a068d959e')

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
