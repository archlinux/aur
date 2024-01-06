# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=openant
pkgname=python-${_base,,}
pkgdesc="ANT, ANT-FS and ANT+ Python Library"
pkgver=1.3.1
pkgrel=1
arch=(any)
url="https://github.com/Tigge/${_base}"
license=(MIT)
depends=(python-pyusb)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('579f0edcdc3d30058ef9d6ecbb60e143c3c47a7bff6212a80fb0f315387eac183c2dbe4c779e78c38d6b767242cd5824a78520b006e583bc55bf5be01f7e3ad1')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest ${_base}/tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --prefix=/usr --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
