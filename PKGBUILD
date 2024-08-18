# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=nbpreview
pkgver=0.9.1
pkgrel=2
pkgdesc="A terminal viewer for Jupyter notebooks. It's like cat for ipynb files."
arch=("x86_64")
url="https://github.com/paw-lu/nbpreview"
license=('MIT')
_name=${pkgname#python-}
depends=(python python-rich python-typer jupyter-nbformat python-pygments ipython python-lxml python-pylatexenc python-httpx python-jinja python-html2text python-types-click python-pillow python-picharsso python-validators python-yarl python-markdown-it-py python-mdit_py_plugins python-click-help-colors python-term-image)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('6ef37b3233de3d45df8905a547cbddb1dfd086621b8e67ab0e4a08b572b3a5c9')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
