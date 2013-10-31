# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Günther Starnberger <gst@sysfrog.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#

pkgname=python2-mrjob
pkgver=0.4.1
pkgrel=1
pkgdesc="Run MapReduce jobs on Hadoop or Amazon Web Services."
url="https://github.com/Yelp/mrjob/"
arch=('any')
depends=('python2' 'python2-boto' 'python2-simplejson' 'python2-yaml')
license=('apache')
source=("https://github.com/Yelp/mrjob/archive/v${pkgver}.tar.gz")
sha512sums=('1666a2f07169d3f88660bed85625fbe58dc63b5cc1c6dd93482f83bafbccd37bc797d6fdbf3b13c6ba005287086e461570d4c0f686075b3ad6f07fb7b77fd013')

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
