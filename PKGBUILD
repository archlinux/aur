# Maintainer : Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=dahdi
pkgver=2.10.0.1
pkgver_tools=2.10.0.1
pkgrel=1
pkgdesc="DAHDI drivers for Asterisk"
arch=('i686' 'x86_64')
url="http://www.asterisk.org/"
license=('GPL2')
depends=('linux' 'libusb' 'perl')
makedepends=('linux-headers')
conflicts=('zaptel')
install="${pkgname}.install"
source=("http://downloads.asterisk.org/pub/telephony/dahdi-linux-complete/releases/dahdi-linux-complete-${pkgver}+${pkgver_tools}.tar.gz"
        "Makefile.patch"
        "dahdi.service")
sha256sums=('7d462d3b007214572f9d049a6d2b6808ab3b91c0bdfca7a91a84c6925056bc55'
            '132b61b37d2e299e93154480a0f66c8493dda552ea6606de0b7344134d1e06a5'
            '7c91314aacab22ffd02794abfa7db49f44a796ea54f3e2bc4276616e68b90e0f')
build() {
  cd "${srcdir}/dahdi-linux-complete-${pkgver}+${pkgver_tools}"
  patch -p0 -i "${srcdir}/Makefile.patch" "${srcdir}/dahdi-linux-complete-${pkgver}+${pkgver_tools}/Makefile"
  make DESTDIR="${pkgdir}" all
}

package() {
  cd "${srcdir}/dahdi-linux-complete-${pkgver}+${pkgver_tools}"
  make DYNFS=1 DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
