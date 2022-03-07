# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Spencer Muise <smuise@spencermuise.ca>

pkgname=calibre-web
pkgver=0.6.17
pkgrel=1
pkgdesc="Web app for browsing, reading and downloading eBooks stored in a Calibre database"
arch=('any')
url="https://github.com/janeczku/calibre-web"
license=('GPL3')
depends=(
  'python'
  'python-babel'
  'python-flask-babel'
  'python-flask-login'
  'python-flask-principal'
  'python-flask'
  'python-pypdf2'
  'python-pytz'
  'python-requests'
  'python-sqlalchemy'
  'python-tornado'
  'python-wand'
  'python-unidecode'
  'python-blinker'
  'python-iso639'
  'python-lxml'
  'python-flask-wtf'
  'python-pycountry'
)
optdepends=(
  'python-jsonschema: kobo sync support'
)
provides=('calibre-web')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/janeczku/calibre-web/archive/${pkgver}.tar.gz"
  'calibre-web.service'
  'calibre-web.sysusers'
  'calibre-web.tmpfiles'
)
md5sums=('e289fb3b0b0b6de481bf31b8854dcd82'
         'e8bd98c32daa92e0dc32fddde579d30f'
         'a0a99595f01f35e5b3f78fa5379d10ae'
         '40101a01e29b944c7eb889b34849d8c5')

package() {
  cd $pkgname-$pkgver
  install -d -m 755 "${pkgdir}/usr/lib/calibre-web"
  cp -a "${srcdir}/$pkgname-$pkgver"/* "${pkgdir}/usr/lib/calibre-web/"
  rm -rf "${pkgdir}/usr/lib/calibre-web/.git"

  install -D -m 644 "${srcdir}/calibre-web.service" "${pkgdir}/usr/lib/systemd/system/calibre-web.service"
  install -D -m 644 "${srcdir}/calibre-web.sysusers" "${pkgdir}/usr/lib/sysusers.d/calibre-web.conf"
  install -D -m 644 "${srcdir}/calibre-web.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/calibre-web.conf"
}
