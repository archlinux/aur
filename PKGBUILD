# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=wpa_supplicant_gui
_pkgname=${pkgname%_gui}
pkgver=2.9
pkgrel=2
pkgdesc="A Qt frontend for interacting with wpa_supplicant"
url="https://w1.fi/wpa_supplicant/"
arch=('x86_64')
depends=('qt5-base' 'wpa_supplicant')
license=('BSD')
source=("https://w1.fi/releases/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('fcbdee7b4a64bea8177973299c8c824419c413ec2e3a95db63dd6a5dc3541f17')

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
