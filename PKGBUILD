# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-sphinx-toolbox
_name=${pkgname#python-}
pkgver=4.2.0
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
  python-typing-inspect

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
sha512sums=('55c1fbf700887a8d2a9bcc8a2c97970a5cdd2b707f193648d5865e8d4416b2d0ad5e801280f73922a217e12fa00c282e0f18dfedf7df4e5207e325c69a401e91')

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
