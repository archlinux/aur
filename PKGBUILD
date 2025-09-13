# Maintainer: Mark Collins < tera_1225 hat hotmail dote com>
# Contributor: gls < ghostlovescorebg at gmail dot com >

pkgname=rompr
pkgver=2.22
pkgrel=1
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
sha256sums=('3dec29f7e8ab076c76872bf85b03b1302c6881733d7907fa4842ec867a83257f')
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
