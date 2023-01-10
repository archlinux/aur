# Maintainer: Eric Berquist <eric dot berquist at gmail dot com>

_name="QCEngine"
_pkgname="qcengine"
pkgname="python-${_pkgname}"
pkgver=0.26.0
pkgrel=2
pkgdesc="Quantum chemistry program executor and IO standardizer (QCSchema) for quantum chemistry"
arch=("any")
url="http://docs.qcarchive.molssi.org/projects/QCEngine/en/stable/"
license=("MIT")
depends=("python-qcelemental" "python-py-cpuinfo" "python-psutil")
checkdepends=("python-pytest")
source=("https://github.com/MolSSI/${_name}/archive/v${pkgver}.tar.gz")
sha256sums=('0659fc6e92d0b8bd2252e4d0290543fdbf6fd5361943b4a43d429fe3074ab2dc')

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
  pytest -rsx -v ${_pkgname}/
}
