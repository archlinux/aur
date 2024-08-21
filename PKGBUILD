# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Wu Junyu <wu.junyu.aur@outlook.com>
# Contributor: Daniel Milde <daniel@milde.cz>
# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
_base=setuptools
pkgbase=pypy-${_base}
pkgname=pypy3-${_base}
pkgver=68.0.0
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=(any)
url="https://${_base}.pypa.io"
license=(MIT)
makedepends=(pypy3)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('da6d535a0db6eaf477c8c2148efbc2100fd88a14f3adad44d20e22bf52bee3f00fe86547ea650fe653519bd6ff5f9ef033a55bb3a05fed041e88e78cdfb81d7e')

prepare() {
  cd "${srcdir}"/${_base}-${pkgver}
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env pypy|" ${_base}/command/easy_install.py
}

# Rename the following function to check() to enable checking
_check_pypy-setuptools() {
  # Workaround UTF-8 tests by setting LC_CTYPE

  # Check pypy3 module
  cd "${srcdir}"/${_base}-${pkgver}
  LC_CTYPE=en_US.utf8 pypy setup.py ptr
}

# Rename the following function to check() to enable checking
_check_pypy3-setuptools() {
  # Workaround UTF-8 tests by setting LC_CTYPE

  # Check pypy3 module
  cd "${srcdir}"/${_base}-${pkgver}
  LC_CTYPE=en_US.utf8 pypy3 setup.py ptr
}

package_pypy-setuptools() {
  depends=(pypy)
  provides=(pypy-distribute)
  replaces=(pypy-distribute)
  cd "${srcdir}/${_base}-${pkgver}"
  pypy setup.py install --prefix=/opt/pypy --root="${pkgdir}" --optimize=1
}

package_pypy3-setuptools() {
  depends=(pypy3)
  provides=(pypy3-distribute)
  replaces=(pypy3-distribute)
  cd "${srcdir}/${_base}-${pkgver}"
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1
}