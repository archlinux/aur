# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: gls <ghostlovescorebg at gmail dot com>
# Contributor: Thermi <noel at familie-kuntze dot de>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=pacemaker
pkgver=1.1.16
pkgrel=2
pkgdesc="advanced, scalable high-availability cluster resource manager"
arch=('i686' 'x86_64')
url="https://github.com/ClusterLabs/${pkgname}/"
license=('GPL2')
makedepends=('libxml2' 'inkscape' 'libqb')
depends=('gnutls' 'glib2' 'pam' 'libtool' 'python' 'libxslt' 'corosync' 'libesmtp')
source=("https://github.com/ClusterLabs/$pkgname/archive/Pacemaker-$pkgver.tar.gz")
md5sums=('a3b9d075bc9114ff698966e57e50bb12')

prepare() {
  cd ${pkgname}-Pacemaker-${pkgver}
  ./autogen.sh
}

build() {
  cd ${pkgname}-Pacemaker-${pkgver}
  CPPFLAGS=-D_FORTIFY_SOURCE=0 \
  ./configure --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --enable-systemd \
              --disable-upstart \
              --with-ais \
              --with-corosync \
              --with-cman \
              --with-cs-quorum \
              --with-nagios \
              --with-snmp \
              --with-esmtp \
              --with-acl
#             --with-nagios-plugin-dir=DIR
#             --with-nagios-metadata-dir=DIR
  make V=0
}

package() {
  cd ${pkgname}-Pacemaker-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: set sw=2 et:
