# Maintainer: Felix Yan <felixonmars@archlinux.org>

_name=hypothesis-auto
pkgname=python-hypothesis-auto
pkgver=1.1.5
_commit=d3a9162feb79b310aa9ce61f8f8ac86caa591d38
pkgrel=2
pkgdesc="Extends Hypothesis to add fully automatic testing of type annotated functions"
url="https://github.com/timothycrosley/hypothesis-auto"
license=('MIT')
arch=('any')
depends=('python-pydantic' 'python-hypothesis')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
checkdepends=('python-pytest')
optdepends=('python-pytest: for pytest plugin')
# NOTE: there are no tags: https://github.com/timothycrosley/hypothesis-auto/issues/14
source=(
  "git+$url#commit=$_commit"
)
sha512sums=('SKIP')

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

check() {
  cd $_name
  python -m pytest -v
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
