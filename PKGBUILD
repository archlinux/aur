# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname='python-taichi'
_name='taichi'
pkgver=0.7.23
pkgrel=1
pkgdesc="Productive & portable programming language for high-performance, sparse & differentiable computing on CPUs & GPUs"
arch=('x86_64')
url="https://github.com/taichi-dev/taichi"
license=('MIT')
depends=('python'
  'python-astor'
  'python-numpy'
  'pybind11'
  'python-pillow'
  'python-dill'
  'ncurses5-compat-libs'
)
optdepends=('python-autograd'
  'python-sourceinspect'
  'python-astpretty'
  'python-colorama'
  'python-gitpython'
  'yapf'
  'cuda')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/18/70/df5fb2533f6a4f58dc6c570ad77ba28e899aefa916b57ba3f2a58b897615/taichi-0.7.23-cp39-cp39-manylinux1_x86_64.whl")

b2sums=('bba5bc8a21ee590288fa78d23d56d51c054ed9b168754b1c93add0db3f6e19a4622fc0e49a29952cb455f74e6bbf8889e7b0724138afb1c75e5484b15871e2b4')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl

  python -O -m compileall -p "${pkgdir}" "${pkgdir}"

  install -Dm644 "$srcdir/$_name-$pkgver.dist-info/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
