# Maintainer: greyltc
# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-pox
pkgver=0.3.4
pkgrel=2
pkgdesc="utilities for filesystem exploration and automated builds"
url='https://pypi.org/project/pox'
arch=(any)
license=('BSD')
depends=('python>=3.8')
makedepends=('python-setuptools>=42.0' 'python-build' 'python-installer' 'python-wheel')
_module="${pkgname#python-}"
_src_name="${_module/-/_}-${pkgver}"
source=("https://pypi.org/packages/source/${_module::1}/${_module}/${_src_name}.tar.gz")
sha256sums=('16e6eca84f1bec3828210b06b052adf04cf2ab20c22fd6fbef5f78320c9a6fed')

build() {
  cd "${_src_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_src_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
