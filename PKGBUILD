# Maintainer: yuhldr <yuhldr@qq.com>

pkgname=('python-symfc')
pkgver=1.5.4
pkgrel=1
pkgdesc="Generate symmetrized force constants"
arch=('any')
url="https://github.com/symfc/symfc"
license=('BSD')
depends=("python-numpy" "spglib" "python-scipy")
makedepends=(python
             python-setuptools
             python-build
             python-pip)

source=("git+https://github.com/symfc/symfc.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir"/symfc
  rm -rf dist
  python -m build --wheel --no-isolation
}


package() {
  cd "$srcdir"/symfc
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
}
