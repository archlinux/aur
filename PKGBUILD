# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dict2css
_name=${pkgname#python-}
pkgver=0.6.0
pkgrel=3
pkgdesc='A μ-library for constructing cascading style sheets from Python dictionaries'
arch=('any')
url='https://github.com/sphinx-toolbox/dict2css'
license=('MIT')
depends=(
  'python'
  'python-domdf-python-tools'
  'python-tinycss2'
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
sha512sums=('ccc774f1ea6b59626627f13f6c9be4c37ac4013c29bfb2eb4f5c3b44176da138e12eda3a2267ba4b49bfeca2bb9a5024c3e1b5b4f8072390dbd1c5e047b52bd5')

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
