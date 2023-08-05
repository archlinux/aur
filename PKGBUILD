# Maintainer: Specter119 <spcter119 AT gmail.com>

pkgname=jupyter-lsp
pkgver=2.2.0
pkgrel=1
pkgdesc='Multi-Language Server WebSocket proxy for Jupyter Notebook/Lab server.'
arch=(any)
url=https://pypi.org/project/$pkgname
license=(MIT)
depends=(python jupyter-server)
makedepends=(python-build python-installer python-wheel)
optdepends=(
  bash-language-server
  javascript-typescript-langserver
  jedi-language-server
  python-language-server
  python-lsp-server
  pyright
  r-languageserver
  texlab
  sql-language-server
  vscode-css-languageserver
  vscode-json-languageserver
  yaml-language-server)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('8ebbcb533adb41e5d635eb8fe82956b0aafbf0fd443b6c4bfa906edeeb8635a1')

build() {
  cd $srcdir/$pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python -m installer --destdir=$pkgdir dist/*.whl
  mv $pkgdir/{usr,}/etc
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
