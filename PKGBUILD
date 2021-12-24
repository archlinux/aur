# Maintainer: Specter119 <spcter119 AT gmail.com>

pkgname=jupyter-lsp
pkgver=1.5.1
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
sha256sums=('751abd35413be99a4331f3597b09341adc755589ed32091ac2f686db3d61267e')

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
