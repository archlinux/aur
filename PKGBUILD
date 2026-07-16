# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=classicimageviewer
_pkgname=ClassicImageViewer
pkgver=2.0.1
pkgrel=2
pkgdesc='Simple and fast multi-platform image viewer and (simple) editor.'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/${pkgname}/${_pkgname}"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-imageformats' 'qt6-tools' 'graphicsmagick' 'hicolor-icon-theme')
optdepends=('exiftool: for information about images')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}.install")
sha256sums=('d0f5c0f05893f67aaf0720bc6870515de8b314558c651a706196e1b095f8452a'
	    'bfab7ab18f30e2975dfff94da8b8b44137ae3542687314b18705689f0c42002c')
install="${pkgname}.install"

# prepare(){
# }


build(){
  cd "$srcdir/${_pkgname}-${pkgver}"
  qmake6 .
  make install
}


package() {
  cd "$srcdir/${_pkgname}-${pkgver}"

  # Manually copy all the built files to the pkg directory:

  # .desktop file:
  install -d -m755 $pkgdir/usr
  install -d -m755 $pkgdir/usr/share
  install -d -m755 $pkgdir/usr/share/applications
  cp ./install/usr/share/applications/${pkgname}.desktop $pkgdir/usr/share/applications

  # metainfo (a single .xml file):
  install -d -m755 $pkgdir/usr/share/metainfo
  cp ./install/usr/share/metainfo/*.xml $pkgdir/usr/share/metainfo/

  # icons:
  install -d -m755 $pkgdir/usr/share/icons
  install -d -m755 $pkgdir/usr/share/icons/hicolor
  install -d -m755 $pkgdir/usr/share/icons/hicolor/128x128
  install -d -m755 $pkgdir/usr/share/icons/hicolor/16x16
  install -d -m755 $pkgdir/usr/share/icons/hicolor/192x192
  install -d -m755 $pkgdir/usr/share/icons/hicolor/22x22
  install -d -m755 $pkgdir/usr/share/icons/hicolor/24x24
  install -d -m755 $pkgdir/usr/share/icons/hicolor/256x256
  install -d -m755 $pkgdir/usr/share/icons/hicolor/32x32
  install -d -m755 $pkgdir/usr/share/icons/hicolor/48x48
  install -d -m755 $pkgdir/usr/share/icons/hicolor/64x64
  install -d -m755 $pkgdir/usr/share/icons/hicolor/128x128/apps
  install -d -m755 $pkgdir/usr/share/icons/hicolor/16x16/apps
  install -d -m755 $pkgdir/usr/share/icons/hicolor/192x192/apps
  install -d -m755 $pkgdir/usr/share/icons/hicolor/22x22/apps
  install -d -m755 $pkgdir/usr/share/icons/hicolor/24x24/apps
  install -d -m755 $pkgdir/usr/share/icons/hicolor/256x256/apps
  install -d -m755 $pkgdir/usr/share/icons/hicolor/32x32/apps
  install -d -m755 $pkgdir/usr/share/icons/hicolor/48x48/apps
  install -d -m755 $pkgdir/usr/share/icons/hicolor/64x64/apps
  cp ./install/usr/share/icons/hicolor/128x128/apps/civ.png  $pkgdir/usr/share/icons/hicolor/128x128/apps/
  cp ./install/usr/share/icons/hicolor/16x16/apps/civ.png    $pkgdir/usr/share/icons/hicolor/16x16/apps/
  cp ./install/usr/share/icons/hicolor/192x192/apps/civ.png  $pkgdir/usr/share/icons/hicolor/192x192/apps/
  cp ./install/usr/share/icons/hicolor/22x22/apps/civ.png    $pkgdir/usr/share/icons/hicolor/22x22/apps/
  cp ./install/usr/share/icons/hicolor/24x24/apps/civ.png    $pkgdir/usr/share/icons/hicolor/24x24/apps/
  cp ./install/usr/share/icons/hicolor/256x256/apps/civ.png  $pkgdir/usr/share/icons/hicolor/256x256/apps/
  cp ./install/usr/share/icons/hicolor/32x32/apps/civ.png    $pkgdir/usr/share/icons/hicolor/32x32/apps/
  cp ./install/usr/share/icons/hicolor/48x48/apps/civ.png    $pkgdir/usr/share/icons/hicolor/48x48/apps/
  cp ./install/usr/share/icons/hicolor/64x64/apps/civ.png    $pkgdir/usr/share/icons/hicolor/64x64/apps/

  # and finally the binary:
  install -d -m755 $pkgdir/usr/bin
  cp ./build/civ $pkgdir/usr/bin/
}
