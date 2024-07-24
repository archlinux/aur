# Maintainer: keutain < quentin dot aniere at gmail dot com>
# Contributor: Henry-Joseph Audéoud <h.audeoud@gmail.com>
# From imunes-git package:
# Contributor: Denis Salopek <denis.sale@gmail.com>
# Contributor: Robin Nehls <aur@manol.is>

pkgname=imunes
pkgver=2.5.0
pkgrel=1
pkgdesc="Integrated Multiprotocol Network Emulator/Simulator"
arch=(any)
url="https://imunes.net/"
license=('custom')
depends=('tk' 'tcllib' 'wireshark-qt' 'imagemagick' 'docker' 'openvswitch' 'xterm')
makedepends=('make')
provides=('imunes')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/imunes/${pkgname}/archive/v${pkgver}.tar.gz"
        '0001-PKGBUILD-compat.patch'
        "${pkgname}.desktop")
sha1sums=('05f6442c8c40e759bdab87d29a6dc90df33e5d30'
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
