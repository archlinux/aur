# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=electricsheep
pkgver=3.0.2
pkgrel=7
_gitcommit=2aee05ceb0b8ec2dfbc6858f7525791c827945f6
pkgdesc='Screensaver that realize the collective dream of sleeping computers from all over the internet'
url='http://community.electricsheep.org/'
arch=('x86_64')
license=('GPL')
depends=('curl' 'flam3' 'ffmpeg' 'lua51' 'libgtop' 'boost-libs' 'freeglut' 'glee' 'wxgtk2' 'tinyxml')
makedepends=('boost' 'mesa' 'glu')
optdepends=('xscreensaver: to use electricsheep with xscreensaver')
options=('!emptydirs')
source=(${pkgname}-${pkgver}-${pkgrel}.tar.gz::https://github.com/Rogach/electricsheep/archive/${_gitcommit}.tar.gz)
sha256sums=('0ed8accd5b871711c7c8573500b7ccac4f9794ed8784ebc994d0ce472b0b154f')

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
