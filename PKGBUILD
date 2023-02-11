# Maintainer: Score_Under <seejay.11@gmail.com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>
# Contributor: BlackLotus89 <maxmusterm@gmail.com>

pkgname=toybox
pkgver=0.8.9
pkgrel=1
pkgdesc='All-in-one Linux command line'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://landley.net/toybox'
license=('BSD')
depends=('attr')
source=(
    "https://landley.net/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz"
    # Alternative link (checksum will be different due to compression): "https://github.com/landley/${pkgname}/archive/${pkgver}.tar.gz"
)
sha256sums=('06913dde3de7139b40f947bd7f23869dfc8796e9c6ff39de02719f8b7b2d47ad')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make defconfig
  NOSTRIP=1 make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  PREFIX="${pkgdir}/opt/${pkgname}" make install
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  ln -sf "/usr/bin/${pkgname}" "${pkgdir}/opt/${pkgname}/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
