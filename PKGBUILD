# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=electricsheep
pkgver=3.0.2
pkgrel=14
_gitcommit=f3417c7a5b6bf5bc56d2cb5572ebfad3661dc740
pkgdesc='Screensaver that realize the collective dream of sleeping computers from all over the internet'
url='http://community.electricsheep.org/'
arch=('x86_64')
license=('GPL')
depends=('curl' 'flam3' 'ffmpeg' 'lua51' 'libgtop' 'boost-libs' 'freeglut' 'glee' 'wxwidgets-gtk3' 'tinyxml')
makedepends=('boost' 'mesa' 'glu')
optdepends=('xscreensaver: to use electricsheep with xscreensaver')
options=('!emptydirs')
source=(${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/Rogach/electricsheep/archive/${_gitcommit}.tar.gz)
sha256sums=('2383e5962d05545ad0321c224d2b443a4f4c57207876555794461e299fd1c5c2')

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
