# vim: set filetype=sh:
# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname='pypy-setuptools'
pkgver=24.0.3
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
depends=('pypy')
provides=('pypy-distribute')
replaces=('pypy-distribute')
url="http://pypi.python.org/pypi/setuptools"
source=("https://pypi.io/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz")
sha512sums=('b591b68fd9dbc6c76d54a4a05b08de6a82bdb6ca8ce1fafd717e5f7e6152207ecadd7f8478f237f8392797fc1f74bae36db5becb69801a972d0bc1aeb56dcf7d')

prepare() {
  cd "${srcdir}"/setuptools-${pkgver}
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env pypy|" setuptools/command/easy_install.py
}

# Rename the following function to check() to enable checking
_check() {
  # Workaround UTF-8 tests by setting LC_CTYPE

  # Check pypy3 module
  cd "${srcdir}"/setuptools-${pkgver}
  LC_CTYPE=en_US.utf8 pypy setup.py ptr
}

package() {
  cd "${srcdir}/setuptools-${pkgver}"
  pypy setup.py install --prefix=/opt/pypy --root="${pkgdir}" --optimize=1
}
