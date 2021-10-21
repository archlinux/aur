# Maintainer: Spencer Muise <smuise@spencermuise.ca>

pkgname=calibre-web-git
pkgver=0.6.13.r95.gfe4db16a
pkgrel=2
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
  'python-flask-wtf'
)
makedepends=('git')
conflicts=('calibre-web')
provides=('calibre-web')
source=(
  'git+https://github.com/janeczku/calibre-web.git'
  'calibre-web.service'
  'calibre-web.sysusers'
  'calibre-web.tmpfiles'
)
md5sums=('SKIP'
         'e8bd98c32daa92e0dc32fddde579d30f'
         'a0a99595f01f35e5b3f78fa5379d10ae'
         '40101a01e29b944c7eb889b34849d8c5')

pkgver() {
  cd calibre-web
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/calibre-web"
  cp -a "${srcdir}/calibre-web"/* "${pkgdir}/usr/lib/calibre-web/"
  rm -rf "${pkgdir}/usr/lib/calibre-web/.git"

  install -D -m 644 "${srcdir}/calibre-web.service" "${pkgdir}/usr/lib/systemd/system/calibre-web.service"
  install -D -m 644 "${srcdir}/calibre-web.sysusers" "${pkgdir}/usr/lib/sysusers.d/calibre-web.conf"
  install -D -m 644 "${srcdir}/calibre-web.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/calibre-web.conf"
}
