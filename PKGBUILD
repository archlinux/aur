# Former Maintainer: gls <ghostlovescorebg at gmail dot com>
# Maintainer: Thermi <noel at familie-kuntze dot de>
# Contributor: Tim Meusel <tim@bastelfreak.de>

pkgname=pacemaker-stable
pkgver=1.1.14
pkgrel=1
pkgdesc="pacemaker stable package, contains the latest stable version"
arch=('x86_64')
url="https://github.com/ClusterLabs/pacemaker/"
license=('GPL2')
makedepends=('autoconf' 'libxml2' 'libxslt' 'corosync' 'inkscape' 'libqb')
depends=('gnutls' 'libdbus' 'glib2' 'pam' 'libtool' 'python')
provides=('pacemaker')
source=("https://github.com/ClusterLabs/pacemaker/archive/Pacemaker-${pkgver}.tar.gz")
sha256sums=('2f73043a5de5e66a47462d37cd68c4c6861f71a03c0ea02eb4ae2b1a550cd7b0')

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
