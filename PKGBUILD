# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pythondata-software-compiler_rt
_name=${pkgname#python-}
_pyname=${_name//-/_}
pkgver=2025.12
pkgrel=1
pkgdesc='Python module containing data files for compiler_rt software (for use with LiteX)'
arch=('any')
url='https://github.com/litex-hub/pythondata-software-compiler_rt'
license=('Apache-2.0')
_pydeps=(
  packaging
)
depends=(
  sh
  python
  "${_pydeps[@]/#/python-}"
)
makedepends=(
  git
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("${_name}::git+${url}.git#tag=$pkgver")
sha256sums=('663933a1273f8ebd502d684adb0badb9391a1bf8a55b84338f3ec8ae3f85848e')

prepare() {
  git -C "${srcdir}/${_name}" clean -dfx
}

build() {
  cd "${srcdir}/${_name}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
