# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dict2css
_name=${pkgname#python-}
pkgver=0.3.0
pkgrel=2
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
sha512sums=('6f9daaeee7e8005b2279780b1a47b9cb5115ee18bb6daa1e3f70cf5e6486af2d7306ee1a6f0de2d9ea54991281c3235a126415cc725959a91f506eacafd5590f')

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
