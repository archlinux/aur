# Contributor: Otto Sabart <seberm[at]gmail[dot]com>
# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=ccfe
pkgver=1.56
pkgrel=3
pkgdesc="Is a tool to quickly supply an interactive screen-oriented interface to command line scripts and commands."
url="http://ccfe.altervista.org"
arch=('any')
license=('GPL2')
depends=('perl-curses-panels-menus-forms')
source=("${pkgname}.tar.gz::http://ccfe.altervista.org/dnload/dnload.php?fname=${pkgname}-${pkgver}.tar.gz" 'ccfeinstall.conf' 'install.patch')

md5sums=('ca5d43c0850235c213a083508edb77b3'
         '9f78a2fa9c90676d60fa9cae28393733'
         '4ce34496f93ce68a7f0bde297d18acfd')

build() {
	true
}

package() {
	
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p0 < $srcdir/install.patch install.sh
	./install.sh -b -p "${pkgdir}/usr" \
                    -c "${pkgdir}/etc/${pkgname}" \
                    -o "${pkgdir}/var/log/${pkgname}" \
                    -d "${pkgdir}/usr/share/doc" \
                    -a "${pkgdir}/usr/share/man" \
                    -m "${pkgdir}/usr/share/${pkgname}/msg"
	install -D -m644 "${srcdir}/ccfeinstall.conf" "${pkgdir}/etc/${pkgname}/ccfeinstall.conf"
}
