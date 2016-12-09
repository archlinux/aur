# Former Maintainer: gls <ghostlovescorebg at gmail dot com>
# Maintainer: Thermi <noel at familie-kuntze dot de>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=pacemaker-stable
pkgver=1.1.16
pkgrel=1
pkgdesc="pacemaker stable package, contains the latest stable version"
arch=('x86_64')
url="https://github.com/ClusterLabs/pacemaker/"
license=('GPL2')
makedepends=('autoconf' 'libxml2'  'corosync' 'inkscape' 'libqb')
depends=('gnutls' 'libdbus' 'glib2' 'pam' 'libtool' 'python' 'libxslt')
provides=('pacemaker')
source=("https://github.com/ClusterLabs/pacemaker/archive/Pacemaker-${pkgver}.tar.gz")
sha256sums=('dffcae035975669a66ab545d45216a637496a251ee2114fa03d58acfcc969202')

prepare() {
  cd ${srcdir}/pacemaker-Pacemaker-${pkgver}
  ./autogen.sh
}

build() {

  cd ${srcdir}/pacemaker-Pacemaker-${pkgver}
  CPPFLAGS=-D_FORTIFY_SOURCE=0
  ./configure --sbindir=/usr/bin \
  --sysconfdir=/etc \
  --libdir=/usr/lib \
  --libexecdir=/usr/lib \
  --localstatedir=/var \
  --enable-systemd \
  --enable-upstart=no \
  --with-corosync \
  --with-acl \
  --with-snmp \
  --with-cs-quorum
  make
}

package() {
  cd ${srcdir}/pacemaker-Pacemaker-${pkgver}
  make DESTDIR="${pkgdir}" install
}
