# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=forkstat-git
pkgver=20140319
pkgrel=1
pkgdesc="Logs process fork(), exec() and exit() activity."
url="http://kernel.ubuntu.com/~cking/forkstat/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc')
makedepends=('git')
conflicts=('forkstat')
provides=('forkstat')
source=('git://kernel.ubuntu.com/cking/forkstat.git')
md5sums=('SKIP')
_gitname="forkstat"

# claims to use netlink but does not link against it?

pkgver() {
  cd "$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$_gitname"
  make PREFIX="/usr"
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
}
