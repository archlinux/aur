# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=tqdm
pkgname=pypy3-${_base}
pkgdesc="Fast, Extensible Progress Meter"
pkgver=4.70.0
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MPL-2.0 MIT)
depends=(pypy3)
makedepends=(pypy3-build pypy3-installer pypy3-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('54ec4c5953e97235253ec458cdfa5a51f62eaf8c8a0bb0040b07c934cf17285ce12590e85d757b60bfde2fe6431ca53f4730a96d597419299aecb1fd6946c943')

build() {
  cd ${_base}-${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "${pkgdir}/usr/bin"
  mv "${pkgdir}/opt/pypy3/bin/tqdm" "${pkgdir}/usr/bin/tqdm-pypy3"
  install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
