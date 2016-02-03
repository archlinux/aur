# Maintainer: chp321 [at] gmail [dot] com

pkgname=monosim-gtk
_pkgname=monosim
pkgver=2.0.1.0
pkgrel=1
pkgdesc='To read, write, update, delete and backup your sim card contacts with standard pcsc smartcard reader'
arch=('any')
url='http://www.integrazioneweb.com/monosim/'
license=('GPL')
makedepends=('git' 'bash')
depends=('mono' 'pcsclite' 'gtk' 'log4net')
source=("monosim-gtk.sh")
md5sums=('b848439288e8e9070e4c096a14224670')

build() {
  cd ${srcdir}
  git clone https://github.com/armando-basile/${_pkgname}.git
  cd ${_pkgname}/build-linux
  bash ./prepare.sh
  bash ./build-lnx-monosim-gtk-full.sh Release
}

package() {
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
  mkdir -p ${pkgdir}/usr/lib/monosim-gtk
  mv ${srcdir}/monosim/monosim-gtk/bin/Release/ ${pkgdir}
  cd ${pkgdir}
  mv Release monosim-gtk
  mv ${pkgdir}/monosim-gtk/ ${pkgdir}/usr/lib/

  # desktop file
  install -Dm644 ${srcdir}/monosim/monosim-gtk/Resources/monosim-gtk \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ${srcdir}/monosim/monosim-gtk/obj/x86/Release/monosimgtk.Resources.chip_48.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
