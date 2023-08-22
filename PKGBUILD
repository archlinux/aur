# Maintainer: Filip Parag <filip@parag.rs>

pkgname=wmrc
pkgver=2.1.1
pkgrel=1
pkgdesc='Simple modular window manager extensions'
arch=('any')
url='https://github.com/filiparag/wmrc'
license=('MIT')
depends=('coreutils')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('6253152ac2b0e10ccfb89498e8e3f2c1f445705621b083b85656f16a151be4cd')

package() {
  cd "${pkgname}-${pkgver}" || return 1
  install -Dm 775 "./${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 664 "./lib${pkgname}.sh" "${pkgdir}/usr/share/${pkgname}/libwmrc.sh"
  install -Dm 644 ./completions.fish "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
  install -Dm 644 "./${pkgname}.1.man" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  sed -i "s/^WMRC_DIR=.*$/WMRC_DIR=\/usr\/share\/${pkgname}/" "${pkgdir}/usr/bin/${pkgname}"
}
