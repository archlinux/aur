# Contributor: Götz Christ <goetzchrist@gmail.com>
_base=PyTTY
pkgname=python-${_base,,}
pkgver=0.4
pkgrel=2
pkgdesc="POSIX serial port access module for Python"
arch=(any)
url="https://pypi.org/project/${_base}"
license=(LGPL-3.0-or-later)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.bz2)
sha512sums=('2b4cc45c7a02878fcc4301d1ca01b5ec039e7a269e9e45f9d7a4bbe76e044945985372a986d8c7fbb2ebcc06f8e6ce7035a590908367fb29f9bc35d56bd28cc5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE-LGPLv3 -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
