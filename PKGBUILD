# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pythondata-software-compiler_rt
_name=${pkgname#python-}
_pyname=${_name//-/_}
pkgver=2026.04
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
sha256sums=('87dd3fc351e7d8883c526ee25e98ac2042d9f29a5d437109d2bf77f790251393')

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
