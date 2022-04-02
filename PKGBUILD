# Maintainer: Alexey Peschany <archlinux at sandboiii dot xyz>
# Contributor: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Thomas Bächler <thomas at archlinux dot org>

pkgname=wpa_supplicant_gui
_pkgname=${pkgname%_gui}
pkgver=2.10
pkgrel=1
pkgdesc="A Qt frontend for interacting with wpa_supplicant"
url="https://w1.fi/wpa_supplicant/"
arch=('x86_64')
depends=('qt5-base' 'wpa_supplicant')
license=('BSD')
source=("https://w1.fi/releases/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('20df7ae5154b3830355f8ab4269123a87affdea59fe74fe9292a91d0d7e17b2f')

build() {
  cd "${_pkgname}-${pkgver}/${_pkgname}/wpa_gui-qt4"
  qmake-qt5 QMAKE_CFLAGS_RELEASE="${CPPFLAGS} ${CFLAGS}" QMAKE_CXXFLAGS_RELEASE="${CPPFLAGS} ${CXXFLAGS}" QMAKE_LFLAGS_RELEASE="${LDFLAGS}"
  make
}

package() {
  cd "${_pkgname}-${pkgver}/${_pkgname}/wpa_gui-qt4"
  install -Dm755 -t "${pkgdir}/usr/bin" wpa_gui
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps" icons/wpa_gui.svg
  install -Dm644 -t "${pkgdir}/usr/share/applications" wpa_gui.desktop
  install -Dm644 -t "${pkgdir}/usr/share/man/man8" ../doc/docbook/wpa_gui.8
}
