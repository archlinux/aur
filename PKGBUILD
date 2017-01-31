# vim: set filetype=sh:
# Maintainer: Daniel Milde <daniel@milde.cz>

pkgbase='pypy-setuptools'
pkgname=(pypy-setuptools pypy3-setuptools)
pkgver=34.1.0
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="http://pypi.python.org/pypi/setuptools"
source=("https://pypi.io/packages/source/s/setuptools/setuptools-${pkgver}.zip")
sha512sums=('5bb52bd8b23464cacb2f89c0e1cdd6c563153ce6981306bb7b0589b510434633dd60711bfd614120842213a922ddc2a357df54bfcd0358a3bfc79941a27a21cc')

prepare() {
  cd "${srcdir}"/setuptools-${pkgver}
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env pypy|" setuptools/command/easy_install.py
}

# Rename the following function to check() to enable checking
_check_pypy-setuptools() {
  # Workaround UTF-8 tests by setting LC_CTYPE

  # Check pypy3 module
  cd "${srcdir}"/setuptools-${pkgver}
  LC_CTYPE=en_US.utf8 pypy setup.py ptr
}

# Rename the following function to check() to enable checking
_check_pypy3-setuptools() {
  # Workaround UTF-8 tests by setting LC_CTYPE

  # Check pypy3 module
  cd "${srcdir}"/setuptools-${pkgver}
  LC_CTYPE=en_US.utf8 pypy3 setup.py ptr
}

package_pypy-setuptools() {
  depends=('pypy' 'pypy-packaging' 'pypy-appdirs')
  makedepends=('pypy' 'pypy-packaging')
  provides=('pypy-distribute')
  replaces=('pypy-distribute')
  cd "${srcdir}/setuptools-${pkgver}"
  pypy setup.py install --prefix=/opt/pypy --root="${pkgdir}" --optimize=1
}

package_pypy3-setuptools() {
  depends=('pypy3' 'pypy3-packaging' 'pypy3-appdirs')
  makedepends=('pypy3' 'pypy3-packaging')
  provides=('pypy3-distribute')
  replaces=('pypy3-distribute')
  cd "${srcdir}/setuptools-${pkgver}"
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1
}

