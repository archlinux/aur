# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: plenae
# Contributor: Spencer Muise <smuise@spencermuise.ca>

pkgname=calibre-web
pkgver=0.6.21
pkgrel=1
pkgdesc="Web app for browsing, reading and downloading eBooks stored in a Calibre database"
arch=('any')
url="https://github.com/janeczku/calibre-web"
license=('GPL3')
depends=(
  'python'
  'python-advocate'
  'python-apscheduler'
  'python-babel'
  'python-cryptography'
  'python-flask'
  'python-flask-babel'
  'python-flask-limiter'
  'python-flask-login'
  'python-flask-principal'
  'python-flask-wtf'
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
sha256sums=('007bc4168c86894b1f4aa8331ffba1c717befe4449c266356cbed6ebd592d337'
            '216c5443424aa9b38b71c53186d0369d2eacd2cb03d742e01c881ab7bac9ea2d'
            'b5d6c225761244b6c698af0279c9501bb9514e3e2a5151ca6e3212a4f5d0d76a'
            '82fae88cbed6d69e5a04586293de81bdc55994a4fe003178c39b5a35f2c87c1a')

package() {
  cd $pkgname-$pkgver
  install -d -m 755 "${pkgdir}/usr/lib/calibre-web"
  cp -a "${srcdir}/$pkgname-$pkgver"/* "${pkgdir}/usr/lib/calibre-web/"
  rm -rf "${pkgdir}/usr/lib/calibre-web/.git"

  install -D -m 644 "${srcdir}/calibre-web.service" "${pkgdir}/usr/lib/systemd/system/calibre-web.service"
  install -D -m 644 "${srcdir}/calibre-web.sysusers" "${pkgdir}/usr/lib/sysusers.d/calibre-web.conf"
  install -D -m 644 "${srcdir}/calibre-web.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/calibre-web.conf"
}
