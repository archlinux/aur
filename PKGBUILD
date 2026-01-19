# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-seekpath')
pkgver=2.2.0
pkgrel=1
pkgdesc="A module to obtain and visualize k-vector coefficients and obtain band paths in the Brillouin zone of crystal structures"
arch=('any')
url="https://github.com/giovannipizzi/seekpath"
license=('MIT')
depends=("python-numpy" "spglib")
optdepends=("python-scipy")
makedepends=(
    'python-setuptools'
    'python'
    "python-flit-core"
)
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90bde4be9e8b8e596905790bfc956fdee5809f62bbc236dc61a0b974feb669bb')

build() {
  cd "$srcdir"/seekpath-$pkgver/
  rm -rf dist
  python -m build --wheel --no-isolation
}


package() {
  cd "$srcdir"/seekpath-$pkgver/
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
}