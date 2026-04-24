# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-sphinx-toolbox
_name=${pkgname#python-}
pkgver=4.2.0rc1
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
sha512sums=('569cd9209a45554333c40138b8b8051047320f9fd36cd4bfca6a2c5be1d619fe79ef9fd7706b59b2b0e0460181ce8f2be47575ff2d3f29583a42236423e01ee7')

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
