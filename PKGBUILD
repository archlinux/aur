# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Specter119 <spcter119 AT gmail.com>

pkgname=jupyterlab-lsp
pkgver=5.1.0
pkgrel=3
pkgdesc="Coding assistance for JupyterLab with Language Server Protocol."
arch=(any)
url="https://github.com/jupyter-lsp/jupyterlab-lsp"
license=(BSD-3-Clause)
depends=(python jupyter-lsp jupyterlab)
makedepends=(python-build python-installer python-wheel python-setuptools npm yarn)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff052231adca0239a97cc04a4eca779affee15f3475017178e6b94d3a398e6ac')

build() {
  cd $pkgname-$pkgver/python_packages/jupyterlab_lsp
  jlpm install
  jlpm build
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname-$pkgver/python_packages/jupyterlab_lsp
  python -m installer --destdir=$pkgdir dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
