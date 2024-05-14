# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-zsh-jupyter-kernel
_name=${pkgname#python-}
pkgver=3.5.0
pkgrel=2
pkgdesc="Z shell kernel for Jupyter"
arch=('any')
url="https://github.com/dahn-zk/zsh-jupyter-kernel"
license=('unknown')
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python-jupyter-client' 'zsh')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a0c18ff6a2e12848cdcaafcc072ea19e8f8db0a78667ad6f0871035ae6d85b79')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    python zsh_jupyter_kernel/install.py --prefix="$pkgdir/usr"
}
