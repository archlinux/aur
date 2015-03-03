# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

_pkgname=pyalpm
pkgname=$_pkgname-git
pkgver=0.6.2.r3.g3c4692b
pkgrel=1
pkgdesc="Libalpm bindings for Python 3 (Git version)"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/users/remy/pyalpm.git/"
license=('GPL')
depends=('python>=3.2' 'pacman')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
makedepends=('git')
source=('git+https://projects.archlinux.org/git/users/remy/pyalpm.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkgname"

  python setup.py install --root="$pkgdir" --optimize=1
}

