# vim: set filetype=sh:
# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname='pypy-setuptools'
pkgver=28.6.1
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
sha512sums=('6c87e3fa6adc6c5127132e3836dbfa1e3515162caad43fd5a78ccc609a9e5e90a0766279e2141f4492bffc5ffdf026876f803303b119afa2d5b6d5a12c9cf21a')

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
