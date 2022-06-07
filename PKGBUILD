# Maintainer: Score_Under <seejay.11@gmail.com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>
# Contributor: BlackLotus89 <maxmusterm@gmail.com>

pkgname=toybox
pkgver=0.8.7
pkgrel=2
pkgdesc='All-in-one Linux command line'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://landley.net/toybox'
license=('BSD')
depends=('attr')
source=(
    "https://landley.net/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz"
    # Alternative link (checksum will be different due to compression): "https://github.com/landley/${pkgname}/archive/${pkgver}.tar.gz"
)
sha256sums=(
    'b508bf336f82cb0739b77111f945931d1a143b5a53905cb753cd2607cfdd1494'
    # github version 0.8.7: b6f43d5738df54623ed21c32f430d1d5c5ac7ef465a6a883890f104b59d5d9e4
)

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
