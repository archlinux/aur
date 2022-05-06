# vim: set filetype=sh:
# Maintainer: Daniel Milde <daniel@milde.cz>

pkgbase='pypy-setuptools'
pkgname=(pypy3-setuptools)
_name=setuptools
pkgver=62.1.0
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="http://pypi.python.org/pypi/setuptools"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('41f39b5aa22e908c123e8e04c11e505e23cd3aaaae72793e106015dc14b1a44ff3b17aa15ca3da34f34a4becc887ceea7f41932650e38d409f95d7227707d2e1')
makedepends=('pypy3' 'pypy')

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
  depends=('pypy')
  provides=('pypy-distribute')
  replaces=('pypy-distribute')
  cd "${srcdir}/setuptools-${pkgver}"
  pypy setup.py install --prefix=/opt/pypy --root="${pkgdir}" --optimize=1
}

package_pypy3-setuptools() {
  depends=('pypy3')
  provides=('pypy3-distribute')
  replaces=('pypy3-distribute')
  cd "${srcdir}/setuptools-${pkgver}"
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1
}

