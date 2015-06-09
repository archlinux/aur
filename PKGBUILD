# Maintainer: Brad Pitcher <bradpitcher@gmail.com>
# Contributor: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>

pkgname=python2-paste-script
pkgver=1.7.5
pkgrel=1
pkgdesc="A pluggable command-line frontend, including commands to setup package file layouts"
arch=('any')
url="http://pythonpaste.org/script/"
license=('custom')
depends=('python2' 'python2-paste>=1.7' 'python2-paste-deploy')
optdepends=('python2-cheetah: for templating' 'python2-flup: utilities for WSGI')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/P/PasteScript/PasteScript-${pkgver}.tar.gz)
replaces=('python-paste-script')
md5sums=('4c72d78dcb6bb993f30536842c16af4d')

package() {
  cd $srcdir/PasteScript-${pkgver}
  python2 setup.py install --root=$pkgdir --optimize=1
  install -Dm644 docs/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
	 -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find $pkgdir -name '*.py')
}
