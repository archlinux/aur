# $Id$
# Maintainer  : Timo Sarawinski <t.sarawinski@gmail.com>
# Original package misses locale in /usr/share/openvas/gst - this package will build full docs and locale
pkgname=greenbone-security-assistant-alternative
_pkgname=gsa
pkgver=7.0.3
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
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gsa/archive/v${pkgver}.tar.gz")
sha512sums=('7e1c1ef939ba08dab3b78baf1aa9c110be2febfbed5d67eefe8110c60f5089a1af44bc26693657226f417c6bd516a4a656eb159dae2a78f878e1a1b6c222b117')
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
