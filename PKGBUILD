# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=quimup
pkgver=1.4.0
pkgrel=1
pkgdesc="Qt5 frontend to MPD"
arch=('i686' 'x86_64')
url=""
license=('GPL2')
makedepends=()
depends=('qt5-base' 'mpd')
source=("http://sourceforge.net/projects/quimup/files/${pkgname} ${pkgver}/${pkgname}_${pkgver}_src.tar.gz"
        "qt-build.patch")
md5sums=('5f5f04bbf9674c278dacab963643bba2'
         '1b37692052408024dc0c9e8b6fe6fc91')

prepare() {
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"
  patch -p0 -i "qt-build.patch"
}

build() {
  cd build
  qmake-qt5 PREFIX=/usr -Wnone "../${pkgname} ${pkgver}/quimup.pro"
  make
}

package() {
  cd build
  install -Dm755 "${srcdir}/build/quimup" "${pkgdir}/usr/bin/quimup"
}

