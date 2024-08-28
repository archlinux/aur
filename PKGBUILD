# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Fernando Ortiz <nandub+arch@nandub.info>
# Contributor: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>
_base=yaml
pkgbase=pypy-${_base}
pkgname=pypy3-${_base}
pkgver=6.0.2
pkgrel=1
pkgdesc="YAML parser and emitter for Python"
arch=(i686 x86_64)
url="https://github.com/${_base}/py${_base}"
license=(MIT)
makedepends=(pypy3-setuptools pypy3-cython)
install=${pkgbase}.install
source=(py${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('c72665131296762521d9ae4fc1c8619946f46ea16ad98b6b8e995828f2cdbd1ed61741fc2d646753f71d95a352b36562a1302f0cb646d5705652cd24b2f10b16')

build() {
  cd ${_base}-${pkgver}
  pypy3 setup.py build
}

package_pypy3-yaml() {
  depends=(pypy3 libyaml)
  pkgdesc+=" for Pypy 3"

  cd ${_base}-${pkgver}
  pypy3 setup.py install --prefix=/opt/pypy3 --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
