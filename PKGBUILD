# Maintainer: Patrick McCarty <pnorcks at gmail dot com>
# submit: Chao Wang <chaowang@redhat.com>

pkgname=koji
pkgver=1.11.0
pkgrel=1
pkgdesc='Koji is a system for building and tracking RPMS. This base package contains shared libraries and the command-line interface.'
arch=('any')
license=('GPL2' 'LGPL2.1')
url="https://pagure.io/koji"
depends=('python2-dateutil' 'python2-krbv' 'python2-pyopenssl' 'urlgrabber' 'rpm-org' 'yum')
makedepends=('python2')
backup=('etc/httpd/conf.d/kojihub.conf'
        'etc/httpd/conf.d/kojiweb.conf'
        'etc/koji-gc/koji-gc.conf'
        'etc/koji-hub/hub.conf'
        'etc/koji-hub/plugins/messagebus.conf'
        'etc/koji-hub/plugins/protonmsg.conf'
        'etc/koji-hub/plugins/rpm2maven.conf'
        'etc/koji-shadow/koji-shadow.conf'
        'etc/koji.conf'
        'etc/kojid/kojid.conf'
        'etc/kojid/plugins/runroot.conf'
        'etc/kojira/kojira.conf'
        'etc/kojivmd/kojivmd.conf'
        'etc/kojiweb/web.conf')
source=("https://releases.pagure.org/koji/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('0ac460de2f0162d8f1336edf9ec30363765303129e244066a47c52d23ab5aef9')

prepare() {
  cd "$pkgname-$pkgver"
  find . -name Makefile -exec sed -i 's|\(PYTHON=\)python|\1python2|' {} \;
  find . -name Makefile -exec sed -i 's|sbin|bin|' {} \;
  find . -name '*.service' -exec sed -i 's|sbin|bin|' {} \;
  find . -type f -exec sed -i 's|^\(#!/usr/bin/\)python|\1python2|' {} \;
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
