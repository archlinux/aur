# vim: set filetype=sh:
# Maintainer: Daniel Milde <daniel@milde.cz>

pkgbase='pypy-setuptools'
pkgname=(pypy-setuptools pypy3-setuptools)
pkgver=36.0.1
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
url="http://pypi.python.org/pypi/setuptools"
source=("https://pypi.io/packages/source/s/setuptools/setuptools-${pkgver}.zip")
sha512sums=('cbcd2591d0d8a7591c5d9a1d4173814afa0b984af29f2e34d26a37c357474b043f371978ac224cea12f50834d91babd9f14b137488c4edcd62594e91aff903d8')
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

