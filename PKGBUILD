# Maintainer: Ian D, Scott <ian@perebruin.com>
pkgname=pacregex-git
pkgver=r64.db5ef25
pkgrel=1
pkgdesc="Advanced regex search of pacman repositories."
arch=('any')
url="https://github.com/ids1024/pacregex"
license=('GPL')
makedepends=('git')
depends=('python' 'pyalpm' 'python-pyparsing' 'rsync')
source=('git://github.com/ids1024/pacregex.git')
md5sums=('SKIP')
_gitname="pacregex"

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
