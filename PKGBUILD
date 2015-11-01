# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='ipwatchd-gnotify'
pkgver='1.0.1'
pkgrel='1'
pkgdesc='IP conflict notification for Gnome desktops'
arch=('i686' 'x86_64')
url='http://ipwatchd.sourceforge.net/'
license=('GPL')
depends=('ipwatchd')
optdepends=('arp-scan: scan entire networks for IP address conflicts' # Can also be used to redisplay conflict notifications.
            'arpwatch: monitor entire networks for IP address conflicts')
_verwatch=("http://sourceforge.net/projects/ipwatchd/files/${pkgname}/" '.*href="'"/projects/ipwatchd/files/${pkgname}/\([^/]\+\)/"'".*' 'f')
source=("http://downloads.sourceforge.net/project/${pkgname%%-*}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('f67798791c8dea16331d5f642d26d38aa5378fe824d61c89426d6770fac54be8')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}/src"
  sed -i -e 's:/sbin:/bin:g' 'Makefile'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}/src"

  make
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}/src"

  make DESTDIR="${pkgdir}/" install
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
