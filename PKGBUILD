# Maintainer: Mark Collins < tera_1225 hat hotmail dote com>
# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=rompr
pkgver=2.09
pkgrel=2
pkgdesc="A php web frontend to MPD and Mopidy"
arch=('any')
url='https://github.com/fatg3erman/RompR/'
license=('custom')
depends=('imagemagick'
         'php' # note that dependencies php-json, php-curl, php-xml and php-mbstring are included in php
         'php-sqlite'
         'php-gd'
         'php-intl'
         'python'
         'python-websockets')
conflicts=('rompr<2.00')
optdepends=('apache: webserver to serve app'
            'nginx: webserver to serve app'
            'mysql: alternate database platform to sqlite')
source=("https://github.com/fatg3erman/RompR/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('f781c552a9fae8da15c451b8eada4fd5b9e25fca0d937c20c18a9b14f3e0ecbd')
install="${pkgname}.install"
backup=("var/lib/${pkgname}/albumart"
	"var/lib/${pkgname}/prefs")
options=('emptydirs')

package() {
   cd "${srcdir}"
   find -name '.svn' -delete
   install -d "${pkgdir}/usr/share/webapps"
   cp -ra "$pkgname" "${pkgdir}/usr/share/webapps/"
   install -d "${pkgdir}/var/lib/${pkgname}/albumart"
   ln -s "/var/lib/${pkgname}/albumart" "${pkgdir}/usr/share/webapps/${pkgname}/albumart"
   install -d "${pkgdir}/var/lib/${pkgname}/prefs"
   ln -s "/var/lib/${pkgname}/prefs"    "${pkgdir}/usr/share/webapps/${pkgname}/prefs"
   install -d "${pkgdir}/usr/share/licenses/$pkgname"
   mv "${pkgdir}/usr/share/webapps/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/"
}
