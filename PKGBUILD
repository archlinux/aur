# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-sphinx-toolbox
_name=${pkgname#python-}
pkgver=4.1.2
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
sha512sums=('e3964e3d52f54aeef1c46d9a8e0b8911b0f944b41d814f597032e08cca3f65cace0f4d2d36ff32d0ac5f2199fcb80e55d7e3e5a1acc9456f63fbf6c48871965e')

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
