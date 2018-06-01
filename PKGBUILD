# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>
# Contributor: BlackLotus89 <maxmusterm@gmail.com>

pkgname=toybox
pkgver=0.7.6
pkgrel=1
pkgdesc='Combines common Linux command line utilities into a single executable'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://landley.net/toybox'
license=('BSD')
depends=('attr')
source=("${url}/downloads/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e2c9643ebc2bcdec4d8f8db25d0b428dbe0928f7b730052dbbd25db47fb9db95')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make defconfig
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  PREFIX="${pkgdir}/usr/${pkgname}" make install
  install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
