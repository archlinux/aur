# Maintainer: David Manouchehri <david@davidmanouchehri.com>
# Contributor: Michael Kopp <kopp.michael@yahoo.de>

_gitname=pdfminer
pkgname=$_gitname-git
_gitbranch=master
_gitauthor=euske
pkgver=r480.14fd0fd
pkgrel=1
pkgdesc="python utils to extract& analyze text data of PDF files."
url="http://www.unixuser.org/~euske/python/pdfminer/"
license=('MIT/X')
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")
validpgpkeys=('F0FE029614EA35BC9E4F9768A6ECFD0C40839755') # David Manouchehri
sha512sums=('SKIP')
arch=('armv6h' 'armv7h' 'i686' 'x86_64') # arch=('any')
depends=('python2')
makedepends=('git' 'python2')
conflicts=("$_gitname")
provides=("$_gitname")

pkgver() {
  cd "$srcdir/$_gitname"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --home=$pkgdir/usr
}

# vim:set sw=2 sts=2 et: