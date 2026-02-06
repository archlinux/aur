# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dict2css
_name=${pkgname#python-}
pkgver=0.3.0.post1
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
sha512sums=('d1b8d9d87373064212d125064a75af706fa00c5717968221add8773ce4d276b443ab301911be358c1ffbfb5612a0e29e4b3c06083f622e8ff549ccf71349e935')

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
