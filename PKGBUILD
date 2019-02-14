# Maintainer: ZaZam <zazaamm at gmail dot com>

_gitname=mpd_queue_random_album
pkgname=mpd_queue_random_album-git
pkgver=1.0.0.843d9c3
pkgrel=1
pkgdesc="Python program to append mpd queue with random albums."
arch=('any')
url="https://github.com/ibeex/$_gitname"
license=('MIT')
depends=('python' 'python-mpd2')
makedepends=('git')
conflicts=('mpdrandom')
source=("git+https://github.com/ibeex/$_gitname")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
## getting the version from setup.py and the id of HEAD
  printf "`grep -o 'version=".*"' setup.py | tr -d 'version="'`.`git rev-parse --short HEAD`"
## git describe does not work here as there are no tags yet
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/"
}
