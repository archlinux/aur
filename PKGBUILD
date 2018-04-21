#Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>

pkgname=notifymuch-git
pkgver=r39.9d4aaf5
pkgrel=1
pkgdesc="Display desktop notifications for unread mail in notmuch database"
arch=('i686' 'x86_64')
url="https://github.com/kspi/notifymuch"
license=('GPL2')
provides=('notifymuch')
makedepends=( 'pygobject-devel')
depends=('python' 'notmuch' 'python-setuptools' )
optdeps=()
source=('notifymuch::git://github.com/kspi/notifymuch')
md5sums=('SKIP')


build() {
  cd $srcdir/notifymuch
  python setup.py build || return 1
}

package() {
  cd $srcdir/notifymuch
  python setup.py install --root=$pkgdir || return 1
}


pkgver() {
  cd "$srcdir/notifymuch"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
