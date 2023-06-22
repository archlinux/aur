#Maintainer: Wu Junyu (aka Tenshi65535) <wu.junyu.aur@outlook.com>
_pkgname="optking"
pkgname="python-${_pkgname}"
pkgver=0.2.1
pkgrel=1
pkgdesc="A Python version of the PSI4 geometry optimization program by R.A. King"
arch=("any")
url="https://github.com/psi-rking/optking"
license=("BSD")
depends=("python-numpy" "python-qcelemental" "python-qcengine" "python-msgpack")
#check ignored since psi4 package might not be installed.
#checkdepends=("python-pytest" "python-pytest-cov" "python-pytest-pep8")
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/psi-rking/optking/archive/${pkgver}.tar.gz)
sha256sums=("7c4a2ea83b61fa91a178d2470612069eb9968ed3157336694c77805752ba545d")

build() {
  cd ${_pkgname}"-"${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}