# vim: set filetype=sh:
# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname='pypy3-setuptools'
pkgver=26.0.0
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=('any')
license=('PSF')
depends=('pypy3')
provides=('pypy3-distribute')
replaces=('pypy3-distribute')
url="http://pypi.python.org/pypi/setuptools"
source=("https://pypi.io/packages/source/s/setuptools/setuptools-${pkgver}.tar.gz")
sha512sums=('878f27f009336ca086c290a3dafb4c68d2cf77d2320503b0696d4d2959358a53ecdf9214c695d0ef5d9d97f38556e84039038c7d3281ab89fe3c330ba17feedd')

prepare() {
  cd "${srcdir}"/setuptools-${pkgver}
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env pypy3|" setuptools/command/easy_install.py
}

# Rename the following function to check() to enable checking
_check() {
  # Workaround UTF-8 tests by setting LC_CTYPE

  # Check pypy3 module
  cd "${srcdir}"/setuptools-${pkgver}
  LC_CTYPE=en_US.utf8 pypy3 setup.py ptr
}

package() {
  cd "${srcdir}/setuptools-${pkgver}"
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1
}
