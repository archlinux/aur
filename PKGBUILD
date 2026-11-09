pkgname=jupyter-ruff-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="JupyterLab and Jupyter Notebook extension for formatting code with Ruff"
arch=('any')
url="https://github.com/leotaku/jupyter-ruff"
license=('BSD-3-Clause')
depends=('jupyterlab>=4.5.2' 'jupyterlab<5' 'python')
makedepends=('python-installer')
provides=("jupyter-ruff=$pkgver")
conflicts=('jupyter-ruff')
source=("https://files.pythonhosted.org/packages/py3/j/jupyter-ruff/jupyter_ruff-$pkgver-py3-none-any.whl")
noextract=("${source[0]##*/}")
sha256sums=('3380298e8012eb1f93b62b53e89f8c45f7ecee1a2dc133c415da261fc60e1f8f')

package() {
  cd "$srcdir"

  python -m installer --destdir="$pkgdir" --prefix=/usr ./*.whl
  install -Dm644 "$pkgdir"/usr/lib/python*/site-packages/jupyter_ruff-"$pkgver".dist-info/licenses/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  sed -i -e 's/"python"/"system"/' -e "s/jupyter-ruff/$pkgname/g" \
    -e 's/your Python package manager (pip, conda, etc.)/pacman/' \
    "$pkgdir/usr/share/jupyter/labextensions/jupyter-ruff/install.json"
}
