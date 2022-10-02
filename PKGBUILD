# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=(yacreader yacreaderlibraryserver)
pkgbase=yacreader
pkgver=9.9.2
_pkgext=2210021
pkgrel=1
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection."
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg' 'hicolor-icon-theme' 'libunarr' 'libpdfium-nojs')
optdepends=(
    'qt5-imageformats: Support for extra image formats'
    'qrencode: YACReaderLibrary server info qr codes'
)
conflicts=('yacreader-bin' 'yacreaderlibraryserver-standalone' 'yacreader-git')
install='yacreader.install'
source=( "https://github.com/YACReader/yacreader/releases/download/${pkgver}/yacreader-${pkgver}.${_pkgext}-src.tar.xz")
sha256sums=('d7364c08ff9fed7d4e291dc0d53b2e850df7a1f9ba0dcf21874880b7a73888a1')

build() {
  cd $srcdir/$pkgbase-$pkgver.${_pkgext}/
  qmake-qt5 CONFIG+="pdfium server_bundled"
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
