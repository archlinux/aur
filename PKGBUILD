# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=phockup
pkgver=1.6.0
pkgrel=1
pkgdesc="Media sorting tool to organize photos and videos from your camera in folders by year, month and day."
arch=(any)
url="https://github.com/ivandokov/phockup"
license=(MIT)
depends=(python perl-image-exiftool)
checkdepends=(python-pytest python-pytest-mock)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ivandokov/phockup/archive/${pkgver}.tar.gz")
sha256sums=('4c61dc9dfac273f893e86b8ad432f44f9fa68eae18d88672f41bb363558b16f0')

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

