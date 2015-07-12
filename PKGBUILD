# Maintainer: Patrick McCarty <pnorcks at gmail dot com>
# submit: Chao Wang <chaowang@redhat.com>

pkgname=koji
pkgver=1.9.0
pkgrel=1
pkgdesc='Koji is a system for building and tracking RPMS. This base package contains shared libraries and the command-line interface.'
arch=('any')
license=('GPL2' 'LGPL2.1')
url=('https://fedorahosted.org/koji/')
depends=('python2-krbv' 'python2-pyopenssl' 'urlgrabber' 'rpm-org')
makedepends=('python2')
source=("https://fedorahosted.org/released/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('ec933af8359408b11478477de83b042a5bdf1d23e85683528aebb53c9bc0e6bc')

prepare() {
  cd "$pkgname-$pkgver"
  find . -name Makefile -exec sed -i 's|\(PYTHON=\)python|\1python2|' {} \;
  find . -name Makefile -exec sed -i 's|sbin|bin|' {} \;
  find . -type f -exec sed -i 's|^\(#!/usr/bin/\)python|\1python2|' {} \;
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
