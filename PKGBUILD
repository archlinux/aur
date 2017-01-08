# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=xonsh
pkgver=0.5.2
pkgrel=1
pkgdesc="A Python-ish, BASHwards-compatible shell"
url="http://xon.sh/"
arch=('any')
license=('FreeBSD')
depends=('python' 'python-ply')
optdepends=('python-prompt_toolkit: support for SHELL_TYPE=prompt_toolkit')
makedepends=('python-setuptools')
source=("https://github.com/scopatz/xonsh/archive/$pkgver.zip")
install=xonsh.install
sha256sums=('b4abe82b20756e8e2249a5ee8aa1afb1cd702e5d8e510bd8598c2fdcdb972bf1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/license"
  site_packages=$(python -c "import site; print(site.__file__.rsplit('/', 2)[-2])")
  install -D -m644 xonsh/parser_table.py "$pkgdir/usr/lib/$site_packages/site-packages/xonsh"
}
