# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Fernando Ortiz <nandub+arch@nandub.info>
# Contributor: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Michal Bozon <michal.bozon__at__gmail.com>
_base=yaml
pkgbase=pypy-${_base}
pkgname=pypy3-${_base}
pkgver=6.0.3
pkgrel=1
pkgdesc="YAML parser and emitter for Python"
arch=(i686 x86_64)
url="https://github.com/${_base}/py${_base}"
license=(MIT)
makedepends=(pypy3-setuptools pypy3-cython)
install=${pkgbase}.install
source=(py${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('a0da43e32d127409ad61b11dc1d733b2e9c743977b3d72c05c81fc2ab183b40bc284452b0874dbeae1a736e1cd4a34f0df641ceefd5e9df38b3e53155fc5f633')

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
