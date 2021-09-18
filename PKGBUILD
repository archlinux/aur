# Contributor: Otto Sabart <seberm[at]gmail[dot]com>
# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=ccfe
pkgver=1.58
pkgrel=2
pkgdesc="Tool to supply an interactive screen-oriented interface to command line scripts and commands"
url="http://ccfe.altervista.org"
arch=('any')
license=('GPL2')
depends=('perl-curses-panels-menus-forms')
source=("${pkgname}.tar.gz::http://ccfe.altervista.org/dnload/dnload.php?fname=${pkgname}-${pkgver}.tar.gz" 'ccfeinstall.conf' 'install.patch')

md5sums=('043617fe5331776a8aa600e505d5fdfa'
         '9f78a2fa9c90676d60fa9cae28393733'
         '2c95353b53b3399ac9317a7a6fd299a4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 < $srcdir/install.patch install.sh
  ./install.sh -b -p "${pkgdir}/usr" \
              -c "${pkgdir}/etc/${pkgname}" \
              -o "${pkgdir}/var/log/${pkgname}" \
              -d "${pkgdir}/usr/share/doc/${pkgname}" \
              -a "${pkgdir}/usr/share/man" \
              -m "${pkgdir}/usr/share/${pkgname}/msg"
  install -D -m644 "${srcdir}/ccfeinstall.conf" "${pkgdir}/etc/${pkgname}/ccfeinstall.conf"
}
