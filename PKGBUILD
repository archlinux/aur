# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: plenae
# Contributor: Spencer Muise <smuise@spencermuise.ca>

pkgname=calibre-web
pkgver=0.6.25
pkgrel=2
pkgdesc="Web app for browsing, reading and downloading eBooks stored in a Calibre database"
arch=('any')
url="https://github.com/janeczku/calibre-web"
license=('GPL3')
depends=(
  'file'
  'python'
  'python-apscheduler'
  'python-babel'
  'python-bleach'
  'python-chardet'
  'python-cryptography'
  'python-flask'
  'python-flask-babel'
  'python-flask-httpauth'
  'python-flask-limiter'
  'python-flask-principal'
  'python-flask-wtf'
  'python-lxml'
  'python-netifaces-plus'
  'python-pycountry'
  'python-pypdf'
  'python-magic'
  'python-pytz'
  'python-regex'
  'python-requests'
  'python-sqlalchemy'
  'python-tornado'
  'python-unidecode'
  'python-urllib3'
  'python-wand'
)
optdepends=(
  'python-jsonschema: kobo sync support'
)
makedepends=(
  'python-setuptools'
  'python-setuptools-scm'
)
provides=('calibre-web')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/janeczku/calibre-web/archive/${pkgver}.tar.gz"
  'calibre-web.service'
  'calibre-web.sysusers'
  'calibre-web.tmpfiles'
)
sha256sums=('68d42fee4800f8ed0220d5da50e703f028874a5f0c3870c50ab50e566bb63f24'
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
