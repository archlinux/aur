# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=prettytable
pkgname=python2-prettytable
pkgver=0.7.2
pkgrel=12
pkgdesc="A simple Python library for easily displaying tabular data"
url="https://pypi.python.org/pypi/PrettyTable"
arch=('any')
license=('BSD')
depends=(python2)
makedepends=(python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/P/PrettyTable/prettytable-${pkgver}.tar.gz"
        '0001-Fix-column-spacing-with-xterm-reset-escape-sequence.patch')
sha256sums=('2d5460dc9db74a32bcc8f9f67de68b2c4f4d2f01fa3bd518764c69156d9cacd9'
            '24e5f10a874910bdc5eab6807443a7f9712ac568fa5e940a313ac5b2a05150f8')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -N -i "$srcdir"/0001-Fix-column-spacing-with-xterm-reset-escape-sequence.patch
  # set interpreter to py2
  sed -i 's|^#!/usr/bin/env python$|#!/usr/bin/env python2|1' *.py
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  chmod 644 -R "${_pkgname}.egg-info"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
