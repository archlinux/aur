# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-ckernel
_name="${pkgname#python-}"
pkgver=0.3.1
pkgrel=1
pkgdesc="IPython kernels for teaching and learning C/C++ in a Jupyter notebook, providing C/C++ syntax highlighting and a little more magic"
arch=('any')
url="https://github.com/adamtuft/c-kernel"
license=('custom:BSD-3-Clause')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-colorama' 'python-ipcqueue' 'python-jupyter-client')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4576e59d5feed67b3d296681002d101c0cd1f7ec205c6407032354419eddbd6f')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}