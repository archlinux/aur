# Maintainer: Greg Fitzgerald <gregf@hugops.pw>

pkgname=mog-git
_gitname=mog
pkgver=0.5.0.r1.g9b906bf
pkgrel=1
pkgdesc="A different take on the UNIX tool cat"
arch=('i686' 'x86_64')
url="https://github.com/witchard/mog"
license=('MIT')
depends=(python python-setuptools)
optdepends=('mediainfo: Used to display image information')
makedepends=('git')
provides=('mog')
conflicts=('mog')
source=("git+https://github.com/witchard/mog.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule update --init
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
