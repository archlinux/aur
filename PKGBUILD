# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=phockup
pkgver=1.10.1
pkgrel=1
pkgdesc="Media sorting tool to organize photos and videos from your camera in folders by year, month and day."
arch=(any)
url="https://github.com/ivandokov/phockup"
license=(MIT)
depends=(python python-tqdm perl-image-exiftool)
checkdepends=(python-pytest python-pytest-mock python-pytest-socket)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ivandokov/phockup/archive/${pkgver}.tar.gz")
sha256sums=('ae627d2638e5b8942d794ba23a382de214d5482c1fd4922949445d755b299379')

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
