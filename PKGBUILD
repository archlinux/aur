# Maintainer: Henry-Joseph Audéoud <h.audeoud@gmail.com>
#
# From imunes-git package:
# Contributor: Denis Salopek <denis.sale@gmail.com>
# Contributor: Robin Nehls <aur@manol.is>

pkgname=imunes
pkgver=2.3.0
pkgrel=2
pkgdesc="Integrated Multiprotocol Network Emulator/Simulator"
arch=(any)
url="http://imunes.net/"
license=('custom')
depends=('tk' 'tcllib' 'wireshark-qt' 'imagemagick' 'docker' 'openvswitch' 'xterm')
makedepends=()
provides=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/imunes/${pkgname}/archive/v${pkgver}.tar.gz"
        '0001-PKGBUILD-compat.patch'
        "${pkgname}.desktop")
sha1sums=('0d1c6fd1ce4afe31735d4dc46ae2ca4ddc74156a'
          '4d68f7f685222a23bb7d54d5cff78aa2da628135'
          '2faf04ac32133b560f2e864493a2e56fa44174dc')

prepare() {
  cd "${pkgname}-${pkgver}" || exit
  patch -p1 -i "${srcdir}/0001-PKGBUILD-compat.patch"
}

package() {
  cd "${pkgname}-${pkgver}" || exit
  make PREFIX="${pkgdir}/usr" REALPREFIX=/usr install
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}

# vim:set ts=2 sw=2 et:
