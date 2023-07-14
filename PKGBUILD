# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=(yacreader yacreaderlibraryserver)
pkgbase=yacreader
pkgver=9.13.0
_pkgext=2307095
pkgrel=1
pkgdesc="Comic reader for cross-platform reading and managing your digital comic collection."
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-quickcontrols2' 'qt5-graphicaleffects' 'qt5-svg' 'hicolor-icon-theme' 'libunarr' 'libpdfium-nojs')
makedepends=('qt5-tools')
optdepends=(
    'qt5-imageformats: Support for extra image formats'
)
conflicts=('yacreader-bin' 'yacreaderlibraryserver-standalone' 'yacreader-git')
install='yacreader.install'
source=( "https://github.com/YACReader/yacreader/releases/download/${pkgver}/yacreader-${pkgver}.${_pkgext}-src.tar.xz")
sha256sums=('7225945cfdbb1d29481a7fd53f4dd6f45dc91fed0d6bf7331b40bf56c605a11c')

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
