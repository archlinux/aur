# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# Contributor: nylocx <aur@nyloc.de>

pkgname=telegramqml
_pkgname=TelegramQML
pkgver=0.9.2
_pkgtar=$pkgver
pkgrel=3
pkgdesc="Telegram API tools for QtQml and Qml"
arch=('i686' 'x86_64')
url="https://github.com/Aseman-Land/TelegramQML"
license=('GPL')
depends=('qt5-webkit' 'qt5-imageformats' 'qt5-graphicaleffects'
         'qt5-quickcontrols' 'libqtelegram-ae')
source=("${_pkgname}-${_pkgtar}.tar.gz::https://github.com/Aseman-Land/TelegramQML/archive/v$_pkgtar.tar.gz")
sha256sums=('16d6429fe180531af167dc44bcc799e82b08c9cfa88f1f635155dfcef2558397')

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgtar}"
  mkdir -p build 
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgtar}/build"
  qmake-qt5 -r .. PREFIX=/usr INSTALL_LIBS_PREFIX=/usr/lib INSTALL_HEADERS_PREFIX=/usr/include BUILD_MODE+=lib QMAKE_CFLAGS_ISYSTEM=
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgtar}/build"
  make INSTALL_ROOT="${pkgdir}" install
}
