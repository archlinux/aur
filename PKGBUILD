# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=python-copier
_name=${pkgname#python-}
pkgver=8.1.0
pkgrel=1
pkgdesc='Library and command-line utility for rendering projects templates'
arch=('any')
url='https://github.com/pykong/copier'
license=('MIT')
depends=(
  'python-backports.cached_property'
  'python-colorama'
  'python-dunamai'
  'python-importlib-metadata'
  'python-iteration-utilities'
  'python-jinja'
  'python-jinja2-ansible-filters'
  'python-packaging'
  'python-pathspec'
  'python-plumbum'
  'python-pydantic'
  'python-pygments'
  'python-pyyaml-include'
  'python-questionary'
  'python-typing_extensions'
  'python-yaml'
)
makedepends=(python-build python-installer python-wheel python-poetry-dynamic-versioning)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('902b4eb65fafe7a1621991234d2ebf3bc3fc9323e64e3a2560a00c05c73f6229')

build() {
  cd "$srcdir/$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
