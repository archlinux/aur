# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Jeremy Ruten <jeremy.ruten@gmail.com>
# Contributor: Brad Conte <brad@bradconte.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=stopwatch
pkgver=3.5
pkgrel=8
pkgdesc="Timing app written in Tcl/Tk"
arch=('any')
url="http://expect.sourceforge.net/${pkgname}/"
license=('custom')
depends=('tk')
source=("${pkgname}-${pkgver}.tar.gz::http://expect.sourceforge.net/${pkgname}/${pkgname}.tar.gz"
	LICENSE)
sha256sums=('f3f56dccd00f669a5f0a4b1f6507ab78e0d1ad18305b760baab34edc68b3ef4e'
            '599c44b010ac89d1b263b7cc783b816db8e7f47073484c42336b2d7f2d2ad8eb')

prepare() {
  mv "${srcdir}/${pkgname}-3.4" "${srcdir}/${pkgname}-${pkgver}"
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i -e 's|/depot/path/wish|/usr/bin/wish|' \
	-e 's|expect.nist.gov|expect.sourceforge.net|g' "${pkgname}"
  sed -i -e 's|expect.nist.gov|expect.sourceforge.net|g' -e 's|#install||' \
	-e 's|#directions||' README 
}

package() {
  cd "${pkgname}-${pkgver}"
  install -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 HISTORY "${pkgdir}/usr/share/doc/${pkgname}/HISTORY"
  install -Dm0644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
