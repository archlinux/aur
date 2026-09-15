# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-sphinx-toolbox
_name=${pkgname#python-}
pkgver=4.3.1
pkgrel=1
pkgdesc='Box of handy tools for Sphinx 🧰 📔'
arch=('any')
url='https://github.com/sphinx-toolbox/sphinx-toolbox'
license=('MIT')
depends=(
  'python'
  python-apeye
  python-autodocsumm
  python-coincidence
  python-dict2css
  python-domdf-python-tools
  python-toctree-plus
  python-typing_inspect

  'python-attrs'
  'python-beautifulsoup4'
  'python-docutils'
  'python-jinja'
  'python-sphinx'
  'python-sphinx-autodoc-typehints'
  'python-pygments'
  'python-pytest'
  'python-pytest-regressions'
  'python-requests'
  'python-ruamel-yaml'
  'python-tabulate'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-whey'
  'python-build'
  'python-license-expression'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=()
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha512sums=('aa1aa289c2b86218f902bc67f388a717339e50e6062d2a1425fe6835cde856c34629ab3a9afaff3a45d2001224093e750b3088ea2925c686e4d2b4e678a36fb1')

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
