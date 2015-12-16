# Maintainer: Patrick McCarty <pnorcks at gmail dot com>
# submit: Chao Wang <chaowang@redhat.com>

pkgname=koji
pkgver=1.10.1
pkgrel=2
pkgdesc='Koji is a system for building and tracking RPMS. This base package contains shared libraries and the command-line interface.'
arch=('any')
license=('GPL2' 'LGPL2.1')
url=('https://fedorahosted.org/koji/')
depends=('python2-krbv' 'python2-pyopenssl' 'urlgrabber' 'rpm-org' 'yum')
makedepends=('python2')
backup=('etc/httpd/conf.d/kojihub.conf'
        'etc/httpd/conf.d/kojiweb.conf'
        'etc/koji-gc/koji-gc.conf'
        'etc/koji-hub/hub.conf'
        'etc/koji-hub/plugins/messagebus.conf'
        'etc/koji-hub/plugins/rpm2maven.conf'
        'etc/koji-hub/plugins/runroot.conf'
        'etc/koji-shadow/koji-shadow.conf'
        'etc/koji.conf'
        'etc/kojid/kojid.conf'
        'etc/kojira/kojira.conf'
        'etc/kojivmd/kojivmd.conf'
        'etc/kojiweb/web.conf')
source=("https://git.fedorahosted.org/cgit/koji/snapshot/${pkgname}-${pkgver}.tar.xz")
sha256sums=('b0782183a9a9eaed969c0e22843e0353660ab30bae74c338a5e9a7d9c3e3fd7a')

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
