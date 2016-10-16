# vim: set filetype=sh:
# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname='pypy-setuptools'
pkgver=28.6.0
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
sha512sums=('16a6896a8c4ff2a14613b9c3030f3b5bd26b33bff06b860c53d76217214afc87d7bf35f7cdd8435b750bbff42381d8e37c6bdde9e25b29438c073d87702e1fac')

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
