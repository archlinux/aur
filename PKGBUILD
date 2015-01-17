# Maintainer: Ian D, Scott <ian@perebruin.com>
pkgname=communitytags-git
pkgver=r39.cf8b6b1
pkgrel=1
pkgdesc="Community provided tags for packages."
arch=('any')
url="https://github.com/ids1024/archcommunitytags-tools"
license=('GPL')
makedepends=('git')
depends=('python' 'pyalpm' 'python-pyparsing')
source=('git://github.com/ids1024/archcommunitytags-tools.git')
md5sums=('SKIP')
_gitname="archcommunitytags-tools"

pkgver() {
  cd "$srcdir/$_gitname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir"
}
