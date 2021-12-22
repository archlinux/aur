# Maintainer: Score_Under <seejay.11@gmail.com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>
# Contributor: BlackLotus89 <maxmusterm@gmail.com>

pkgname=toybox
pkgver=0.8.6
pkgrel=2
pkgdesc='All-in-one Linux command line'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://landley.net/toybox'
license=('BSD')
depends=('attr')
source=("https://github.com/landley/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e2c4f72a158581a12f4303d0d1aeec196b01f293e495e535bcdaf75eb9ae0987')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make defconfig
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  PREFIX="${pkgdir}/opt/${pkgname}" make install
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  ln -sf "/usr/bin/${pkgname}" "${pkgdir}/opt/${pkgname}/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
