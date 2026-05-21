# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dict2css
_name=${pkgname#python-}
pkgver=0.5.1
pkgrel=1
pkgdesc='A μ-library for constructing cascading style sheets from Python dictionaries'
arch=('any')
url='https://github.com/sphinx-toolbox/dict2css'
license=('MIT')
depends=(
  'python'
  python-cssutils
  'python-css-parser'
  'python-domdf-python-tools'
)
makedepends=(
  'git'
  'python-whey'
  'python-license-expression'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=()
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha512sums=('c7e17e4601fdaf23a150e401b390e00c7d855436e14c873a94a06e91297c0d75188685804d5ee0e7b4011a191e98140e11737e167bca3df95941291e83ae7a0e')

prepare() {
  git -C "${srcdir}/${_name}" clean -dfx
}

build() {
  cd "${srcdir}/${_name}"
  python -m whey --wheel
}

package() {
  cd "${srcdir}/${_name}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
