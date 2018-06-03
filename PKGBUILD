# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Chao Wang <chaowang@redhat.com>

pkgname=koji
pkgver=1.16.0
pkgrel=1
pkgdesc='shared libraries and the command-line interface for building and tracking RPMS'
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
sha256sums=('b857d5c45cb18be7d1cc33a9324e2b8e7febb45c4422360ddeb3342fcfa3a668')

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
