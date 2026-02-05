# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-whey
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=2
pkgdesc='A simple Python wheel builder for simple projects'
arch=('any')
url='https://whey.readthedocs.io/'
license=('MIT')
depends=(
  'python'
  'python-attrs'
  'python-click'
  'python-natsort'
  'python-packaging'

  'python-consolekit'
  'python-dist-meta'
  'python-dom-toml'
  'python-domdf-python-tools'
  'python-handy-archives'
  'python-pyproject-parser'
  'python-shippinglabel'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=(
  'python-docutils: readme functionality'
  'python-readme-renderer: readme functionality'
  # 'python-cmarkgfm: readme functionality'
  'python-editables: editable installs'
)
source=("${_name}::git+https://github.com/repo-helper/whey.git#tag=v$pkgver")
sha512sums=('2d2de412ec4b9d6441b6ecc603335f29bfaa7c4a32e7692a4d80be80a3fc1badcd3c0a43a54f25a924a3710bb0d055f63565fa789aaa0f85539c114d27743e19')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed \
    -e 's/^requires = \[.*/requires = \[ "setuptools", "wheel" \]/' \
    -i pyproject.toml
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
