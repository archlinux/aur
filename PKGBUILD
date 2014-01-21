# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Günther Starnberger <gst@sysfrog.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#

pkgname=python2-mrjob
pkgver=0.4.2
pkgrel=1
pkgdesc="Run MapReduce jobs on Hadoop or Amazon Web Services."
url="https://github.com/Yelp/mrjob/"
arch=('any')
depends=('python2' 'python2-boto' 'python2-simplejson' 'python2-yaml')
license=('apache')
source=("https://github.com/Yelp/mrjob/archive/v${pkgver}.tar.gz")
sha512sums=('9f7e878bf1838b2fad77d7dc54fcef6f7e888c10dfc00a5ac7946e5963752efe9ff5bc93ab77bd2f04bea61eaa0ed6e55283722d96d8002c1b171a0066f3b644')

build() {
  true
}

package() {
  cd "${srcdir}/mrjob-${pkgver}"

  python2 setup.py install --prefix=/usr --root="${pkgdir}"
  find "${pkgdir}" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
}
