# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Maintainer: Specter119 <spcter119 AT gmail.com>

pkgname=jupyter-lsp
pkgver=2.2.4
pkgrel=2
pkgdesc="Multi-Language Server WebSocket proxy for Jupyter Notebook/Lab server."
arch=(any)
url="https://github.com/jupyter-lsp/jupyterlab-lsp"
license=(BSD-3-Clause)
depends=(python jupyter-server)
makedepends=(python-build python-installer python-wheel python-setuptools)
optdepends=(
  bash-language-server
  javascript-typescript-langserver
  jedi-language-server
  python-lsp-server
  pyright
  r-languageserver
  texlab
  sql-language-server
  vscode-css-languageserver
  vscode-json-languageserver
  yaml-language-server)
source=("$url/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('5e50033149344065348e688608f3c6d654ef06d9856b67655bd7b6bac9ee2d59')

build() {
  cd $srcdir/$pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python -m installer --destdir=$pkgdir dist/*.whl
  mv $pkgdir/{usr,}/etc
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
