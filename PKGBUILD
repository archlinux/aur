# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
#
# From imunes-git
# Contributor: Denis Salopek <denis.sale@gmail.com>
# Contributor: Robin Nehls <aur@manol.is>

pkgname=imunes
pkgver=2.3.0
pkgrel=1
pkgdesc="Integrated Multiprotocol Network Emulator/Simulator"
arch=(any)
url="http://imunes.net/"
license=('custom')
depends=('tk' 'tcllib' 'wireshark-qt' 'imagemagick' 'docker' 'openvswitch' 'xterm')
makedepends=()
provides=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/imunes/${pkgname}/archive/v${pkgver}.tar.gz"
        '0001-PKGBUILD-compat.patch')
sha1sums=('0d1c6fd1ce4afe31735d4dc46ae2ca4ddc74156a'
          '4d68f7f685222a23bb7d54d5cff78aa2da628135')

prepare() {
  cd "${pkgname}-${pkgver}" || exit
  patch -p1 -i "${srcdir}/0001-PKGBUILD-compat.patch"
}

package() {
  cd "${pkgname}-${pkgver}" || exit
  make PREFIX="${pkgdir}/usr" REALPREFIX=/usr install
  install -D COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
