# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCEngine"
_pkgname="qcengine"
pkgname="python-${_pkgname}"
pkgver=0.13.0
pkgrel=1
pkgdesc="Quantum chemistry program executor and IO standardizer (QCSchema) for quantum chemistry"
arch=("any")
url="http://docs.qcarchive.molssi.org/projects/QCEngine/en/stable/"
license=("MIT")
depends=("python-qcelemental" "python-py-cpuinfo" "python-psutil")
checkdepends=("python-pytest-cov")
source=("https://github.com/MolSSI/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5f2c807b2a46caa4bd50dcea4853f5bd6360c896d42338e0bfc7a8f5ca961d25')

build() {
  cd "${srcdir}"/"${_name}"-"${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  pytest -rsx -v --cov=${_pkgname}/ ${_pkgname}/
}
