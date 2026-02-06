# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-toctree-plus
_name=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc='Enhanced Sphinx TocTree which shows classes, functions etc. as if they were sections'
arch=('any')
url='https://github.com/sphinx-toolbox/toctree_plus'
license=('BSD-3-Clause')
depends=(
  'python'
  'python-docutils'
  'python-sphinx'
)
makedepends=(
  'git'
  python-whey
  'python-build'
  'python-license-expression'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=()
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha512sums=('3860c31e6ce66fd762425486b62322106305096a098ae8aede608154378d8776ea28710c7a4d60ed400aae09571be1fa7e317d48734e325d2ae60fae33d7eaaa')

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
