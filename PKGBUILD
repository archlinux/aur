# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=(yacreader yacreaderlibraryserver)
pkgbase=yacreader
pkgver=9.14.2
_pkgext=2402143
pkgrel=1
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection."
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL3')
depends=('qt6-base' 'qt6-multimedia' 'qt6-quickcontrols2' 'qt6-svg' 'qt6-imageformats' 'qt6-5compat' 'hicolor-icon-theme' 'libunarr' 'libpdfium-nojs')
makedepends=('qt6-tools')
conflicts=('yacreader-bin' 'yacreaderlibraryserver-standalone' 'yacreader-git')
install='yacreader.install'
source=( "https://github.com/YACReader/yacreader/releases/download/${pkgver}/yacreader-${pkgver}.${_pkgext}-src.tar.xz")
sha256sums=('9fe5dd9f140d539634908840e34bd6b3474a0ed6512cfc16de65185c0f098a53')

build() {
  cd $srcdir/$pkgbase-$pkgver.${_pkgext}/
  qmake6 CONFIG+="pdfium server_bundled"
  make
}

package_yacreader() {
  cd $srcdir/$pkgbase-$pkgver.${_pkgext}/
  make INSTALL_ROOT="$pkgdir" sub-YACReader-install_subtargets sub-YACReaderLibrary-install_subtargets
}

package_yacreaderlibraryserver() {
  pkgdesc="Headless YACReaderLibrary server for use with YACReader for iOS."
  install=yacreaderlibraryserver.install
  cd $srcdir/$pkgbase-$pkgver.${_pkgext}/
  make INSTALL_ROOT="$pkgdir" sub-YACReaderLibraryServer-install_subtargets
}
