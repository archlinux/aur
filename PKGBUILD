# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-pyproject-parser
_name=${pkgname#python-}
pkgver=0.14.0
pkgrel=1
pkgdesc="Parser for pyproject.toml"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/repo-helper/pyproject-parser"
depends=(
  python
  python-apeye-core
  python-attrs
  python-dom-toml
  python-domdf-python-tools
  python-natsort
  python-packaging
  python-shippinglabel
  python-toml
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
  python-hatch-requirements-txt
  python-setuptools
  python-wheel
)
optdepends=(
  'python-readme-renderer: render markdown'
  'python-cmarkgfm: render markdown'
)
license=('MIT')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha512sums=('6eef1ee28a1c0ee37d47bb4849617daf92b2ead7f142fd781b9a862a2be79ac3eb88d9d7c2afdce38623f40fc81226504da92458baff0f1fd06da51814875d2b')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
