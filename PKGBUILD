pkgname=python-bd_warehouse-git
pkgdesc="A build123d parametric part collection"
pkgver=r147.48c507b
pkgrel=1
arch=('any')
url="https://github.com/gumyr/bd_warehouse"
license=('Apache')
depends=('python-build123d' 'python-typing_extensions')
makedepends=('git' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
_name=${pkgname#python-}
source=("${_name}::git+https://github.com/gumyr/bd_warehouse.git"
        "pyproject_fixes.patch")
sha256sums=('SKIP'
            'cc105c091b2a4bcacb7449a2d18266bb643d937f4b772f9f4abc2eaacbe3b33f')

pkgver() {
  cd $_name
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd $_name
  patch -Np1 -i ../pyproject_fixes.patch
}


build() {
  cd $_name
  python -m build --wheel --no-isolation
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
