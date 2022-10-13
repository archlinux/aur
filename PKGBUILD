# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=phockup
pkgver=1.9.2
pkgrel=1
pkgdesc="Media sorting tool to organize photos and videos from your camera in folders by year, month and day."
arch=(any)
url="https://github.com/ivandokov/phockup"
license=(MIT)
depends=(python python-tqdm perl-image-exiftool)
checkdepends=(python-pytest python-pytest-mock)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ivandokov/phockup/archive/${pkgver}.tar.gz")
sha256sums=('6604004b12ed47079b81f5948845b33a87b3449eacd51643e416c5bde93bcecf')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pytest
}

package() {
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp "${srcdir}/${pkgname}-${pkgver}/phockup.py" "${pkgdir}/usr/share/${pkgname}/phockup.py"
  cp -r "${srcdir}/${pkgname}-${pkgver}/src" "${pkgdir}/usr/share/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s /usr/share/"${pkgname}"/phockup.py "${pkgdir}"/usr/bin/phockup

  install -D "${srcdir}/${pkgname}-${pkgver}/license" "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
}

