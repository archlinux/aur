# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-ckernel
_name="${pkgname#python-}"
pkgver=0.5.3
pkgrel=1
pkgdesc="IPython kernels for teaching and learning C/C++ in a Jupyter notebook, providing C/C++ syntax highlighting and a little more magic"
arch=('any')
url="https://github.com/adamtuft/c-kernel"
license=('custom:BSD-3-Clause')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python-colorama' 'python-sysv_ipc' 'python-jupyter-client')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('be971aa502538f51b7c40acd99a20edbac510353a388a4ec0c0cc4f1feed1205')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
