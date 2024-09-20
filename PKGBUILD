# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Wu Junyu <wu.junyu.aur@outlook.com>
# Contributor: Daniel Milde <daniel@milde.cz>
# Contributor: Yen Chi Hsuan <yan12125@gmail.com>
_base=setuptools
pkgname=pypy-${_base}
pkgver=75.1.0
pkgrel=1
epoch=1
pkgdesc="Easily download, build, install, upgrade, and uninstall Python packages"
arch=(any)
url="https://${_base}.pypa.io"
license=(MIT)
depends=(pypy)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('5003e81c7988dd522cfba233ac643ade9a1ff074a13182a81da7fe3f40565b97dd2696c96b8a0694fcd3417e527e2cf6d6ea5e21d29ff927c1ab5916a2607239')

prepare() {
  cd "${srcdir}"/${_base}-${pkgver}
  sed -i -e "s|^#\!.*/usr/bin/env python|#!/usr/bin/env pypy|" setup.py
}

package() {
  cd "${srcdir}/${_base}-${pkgver}"
  pypy setup.py install --prefix=/opt/pypy --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
