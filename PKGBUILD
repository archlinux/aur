# $Id: PKGBUILD 310007 2017-11-15 14:11:34Z foutrelis $
# Maintainer: Thomas Bächler <thomas@archlinux.org>

pkgname=wpa_supplicant_gui
pkgver=2.6
pkgrel=1
pkgdesc="A Qt frontend to wpa_supplicant"
url="http://hostap.epitest.fi/wpa_supplicant"
arch=('x86_64')
depends=('qt5-base' 'wpa_supplicant')
license=('GPL')
source=("http://hostap.epitest.fi/releases/wpa_supplicant-$pkgver.tar.gz")
sha256sums=('b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b1450')

build() {
  cd wpa_supplicant-${pkgver}/wpa_supplicant/wpa_gui-qt4
  qmake-qt5 QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

package() {
  cd wpa_supplicant-${pkgver}/wpa_supplicant/wpa_gui-qt4
  install -Dm755 wpa_gui "${pkgdir}/usr/bin/wpa_gui"
  install -Dm644 icons/wpa_gui.svg "${pkgdir}/usr/share/pixmaps/wpa_gui.svg"
  install -Dm644 wpa_gui.desktop "${pkgdir}/usr/share/applications/wpa_gui.desktop"
  install -Dm644 "${srcdir}/wpa_supplicant-${pkgver}/wpa_supplicant/doc/docbook/wpa_gui.8" \
     "${pkgdir}/usr/share/man/man8/wpa_gui.8"
}
