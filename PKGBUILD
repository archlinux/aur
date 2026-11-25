# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-sphinx-toolbox
_name=${pkgname#python-}
pkgver=4.4.0
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
sha512sums=('818bbf28bc2594031bb916bdce821d01702cef682f453c4523925e87223c729279887c6c7a14a43f4b2032da37a766a20ef20be3f83884fdc2fb0f3e7f1f9d9e')

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
