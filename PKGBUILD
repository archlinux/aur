# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=python-fastrpc-git
_gitname=fastrpc
pkgver=v8.0.8.r3.g24413dd
pkgrel=1
pkgdesc="Python FastRPC library"
url="https://github.com/seznam/fastrpc"
arch=('any')
license=('GPL')
depends=('python' 'fastrpc-git')
makedepends=('python-setuptools' 'python-debian')
source=("git://github.com/seznam/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname/python"
  python setup.py install --root=$pkgdir

  cd "$srcdir/$_gitname/netcat"
  install -D -m755 fastrpc-netcat3 "$pkgdir/usr/bin/fastrpc-netcat3"
  install -D -m755 fastrpc-netcat "$pkgdir/usr/bin/fastrpc-netcat"
}

