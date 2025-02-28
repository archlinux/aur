pkgname=python-bd_warehouse-git
pkgdesc="A build123d parametric part collection"
pkgver=r152.e3a1f27
pkgrel=1
arch=('any')
url="https://github.com/gumyr/bd_warehouse"
license=('Apache')
depends=('python-build123d' 'python-typing_extensions')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
_name=${pkgname#python-}
source=("${_name}::git+https://github.com/gumyr/bd_warehouse.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
