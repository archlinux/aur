# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="exdir"
pkgname="python-${_name}"
pkgver=0.5.0
pkgrel=1
pkgdesc="Directory structure standard for experimental pipelines"
arch=("any")
url="https://exdir.readthedocs.io/"
license=("MIT")
makedepends=("python-setuptools")
depends=("python-numpy" "python-ruamel-yaml")
optdepends=(
  "python-quantities"
)
checkdepends=(
  "python-h5py"
  "python-pytest"
  "python-quantities"
  "python-six"
)
source=("https://github.com/CINPLA/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('894ef461e473ed29115d1e55eeab264a977892f12d882fc3193919d1e7786864')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m pytest
}
