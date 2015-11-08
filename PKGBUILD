# Maintainer: megadriver <megadriver at gmx dot com>

pkgname=xonsh-git
_gitname=xonsh
pkgver=0.2.3
pkgrel=1
pkgdesc="A Python-ish, BASHwards-compatible shell"
url="http://github.com/scopatz/xonsh"
arch=('any')
license=('FreeBSD')
depends=('python' 'python-ply')
conflicts=('xonsh')
source=("git://github.com/scopatz/$_gitname.git"
	"0001-installation-of-jupyter-hook-to-given-destination.patch")
install=xonsh.install
sha256sums=('SKIP'
	'0cacd63515b512e390cabd46b076c3f0461e1cd3a7218f8830bd1b0ccd860498')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  patch setup.py "$srcdir/0001-installation-of-jupyter-hook-to-given-destination.patch"
  python setup.py install --root=$pkgdir
  install -D -m644 license "$pkgdir/usr/share/licenses/$_gitname/license"
}

