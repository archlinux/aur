# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dict2css
_name=${pkgname#python-}
pkgver=0.4.0
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
sha512sums=('19126958e60663b47e38bd2c59d439322090ac34af1bfbae14e519b6b5eaabc624d7efcc7d66619e3af86377e3739a2637358f5657bff0ef61900cdda3654f4c')

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
