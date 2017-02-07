# Maintainer: Daniel Milde <daniel at milde dot cz>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=xonsh
pkgver=0.5.3
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
sha256sums=('aadffef75c22e9ea7a77bcf6242091dcd77fa754415e289067d8b7abbccf61ce')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$pkgname/license"
  site_packages=$(python -c "import site; print(site.__file__.rsplit('/', 2)[-2])")
  install -D -m644 xonsh/parser_table.py "$pkgdir/usr/lib/$site_packages/site-packages/xonsh"
}
