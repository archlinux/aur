# Maintainer: Jonathan Waldrep <spartan074@gmail.com>
# Contributer: Tomas Bächler <thomas@archlinux.org>

pkgname=eapol_test
_parentpkgname=wpa_supplicant
pkgver=2.6
pkgrel=1
epoch=1
pkgdesc="EAP peer and RADIUS client testing"
url="https://w1.fi/wpa_supplicant/devel/testing_tools.html#eapol_test"
arch=('i686' 'x86_64')
depends=('wpa_supplicant')
license=('GPL')
source=("http://w1.fi/releases/${_parentpkgname}-${pkgver}.tar.gz"
        'config')
sha256sums=('b4936d34c4e6cdd44954beba74296d964bc2c9668ecaa5255e499636fe2b1450'
            '5163609e133851dfbbee5982954fab22e45bf2c9093e43eb466d8a2c39f8a012')

prepare() {
  cd "${srcdir}/${_parentpkgname}-${pkgver}/${_parentpkgname}"
  cp "${srcdir}/config" ./.config
}

build() {
  cd "${srcdir}/${_parentpkgname}-${pkgver}/${_parentpkgname}"

  # The Makefile does not pick up our CPPFLAGS
  export CFLAGS="$CPPFLAGS $CFLAGS"
  make LIBDIR=/usr/lib BINDIR=/usr/bin eapol_test
}

package() {
  cd "${srcdir}/${_parentpkgname}-${pkgver}/${_parentpkgname}"

  mkdir -p "${pkgdir}/usr/bin"
  install -m755 eapol_test "${pkgdir}/usr/bin/eapol_test"
}
