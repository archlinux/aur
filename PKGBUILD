# Maintainer: Specter119 <spcter119 AT gmail.com>

pkgname=jupyter-lsp
pkgver=2.1.0
pkgrel=1
pkgdesc='Multi-Language Server WebSocket proxy for Jupyter Notebook/Lab server.'
arch=(any)
url=https://pypi.org/project/$pkgname
license=(MIT)
depends=(python jupyter-server)
makedepends=(python-setuptools)
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
sha256sums=('3aa2cbd81d3446256c34e3647d71b8f50617d07862a1c60fbe123f901cdb0dd2')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root $pkgdir --skip-build --optimize=1
  mv $pkgdir/{usr,}/etc
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
