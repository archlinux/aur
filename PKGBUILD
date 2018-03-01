# $Id$
# Maintainer  : Timo Sarawinski <t.sarawinski@gmail.com>
# Original package misses locale in /usr/share/openvas/gst - this package will build full docs and locale
pkgname=greenbone-security-assistant-alternative
_pkgname=greenbone-security-assistant
pkgver=7.0.2
pkgrel=1
pkgdesc='Greenbone Security Assistant (gsa) - OpenVAS web frontend with locale , full doc and systemd service'
url='http://www.openvas.org/'
license=(GPL)
arch=('x86_64')
depends=('openvas-systemd' 'libmicrohttpd' 'python-polib' 'gettext' 'gnutls' 'libgcrypt' 'libxml2' 'openvas-libraries' 'libxslt')
makedepends=('cmake' 'doxygen' 'xmltoman')
provides=('greenbone-security-assistant')
groups=(openvas)
backup=(etc/openvas/gsad_log.conf)
# These URLs need to be manually updated on every pkgver upgrade.
# http://wald.intevation.org/frs/?group_id=29
source=("http://wald.intevation.org/frs/download.php/2429/greenbone-security-assistant-7.0.2.tar.gz"
        "http://wald.intevation.org/frs/download.php/2430/greenbone-security-assistant-7.0.2.tar.gz.sig")
sha512sums=('e3ccc8704845d8271a8628a19f7a79aea6c19f2cd52f4c69ee698b314c3b8de1099831394c8b474fa79fb1bba4dc5c42e88351edeca82e1c1b4f46f625f746ae'
            'SKIP')
validpgpkeys=(
              'C3B468D2288C68B9D526452248479FF648DB4530' # OpenVAS Transfer Integrity
)
conflicts=(gsa)
provides=(gsa)
replaces=(gsa)

build() {
  cd "${_pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var . -DSBINDIR=/usr/bin
  make
  make doc
  make doc-full
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
