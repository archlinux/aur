# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCEngine"
_pkgname="qcengine"
pkgname="python-${_pkgname}"
pkgver=0.11.0
pkgrel=1
pkgdesc="Quantum chemistry program executor and IO standardizer (QCSchema) for quantum chemistry"
arch=("any")
url="http://docs.qcarchive.molssi.org/projects/QCEngine/en/stable/"
license=("MIT")
depends=("python-qcelemental" "python-py-cpuinfo" "python-psutil")
checkdepends=("python-pytest-cov")
source=("https://github.com/MolSSI/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0d1e2e5464f02b8bb0446f8f929428a440a406a652df48b1dc8b41dd95efbd5b')

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
