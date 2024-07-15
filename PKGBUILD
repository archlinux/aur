# Maintainer: Mark Collins < tera_1225 hat hotmail dote com>
# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=rompr
pkgver=2.16
pkgrel=2
pkgdesc="A php web frontend to MPD and Mopidy"
arch=('any')
url='https://github.com/fatg3erman/RompR/'
license=('LicenseRef-rompr')
depends=(
  'imagemagick'
  'php' # php-json, php-curl, php-xml and php-mbstring are included in php
  'php-sqlite'
  'php-gd'
  'php-intl'
  'python'
  'python-websockets'
)
conflicts=('rompr<2.00')
optdepends=(
  'apache: webserver to serve app'
  'nginx: webserver to serve app'
  'mysql: alternate database platform to sqlite'
  'atomicparsley: handle metadata in m4a podcasts'
)
source=("https://github.com/fatg3erman/RompR/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('717256dd8478948479d1daaaf84278c6f77696f81b8ae9d65f5ea28a350b95af')
install="${pkgname}.install"
backup=(
  "var/lib/${pkgname}/albumart"
  "var/lib/${pkgname}/prefs"
)
options=('emptydirs')

package() {
   cd "${srcdir}"
   find -name '.svn' -delete
   install -d "${pkgdir}/usr/share/webapps"
   cp -ra "$pkgname" "${pkgdir}/usr/share/webapps/"
   install -d "${pkgdir}/var/lib/${pkgname}/albumart"
   ln -s "/var/lib/${pkgname}/albumart" "${pkgdir}/usr/share/webapps/${pkgname}/albumart"
   install -d "${pkgdir}/var/lib/${pkgname}/prefs"
   ln -s "/var/lib/${pkgname}/prefs" "${pkgdir}/usr/share/webapps/${pkgname}/prefs"
   install -d "${pkgdir}/usr/share/licenses/$pkgname"
   mv "${pkgdir}/usr/share/webapps/${pkgname}/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
