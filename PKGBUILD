# Author: Axujen <axujen@gmail.com>
# Maintainer: qlonik <volodin.n at gmail dot com>

_gitauthor=axujen
_gitname=mpdrandom
pkgname=mpdrandom-git
pkgver=1.1.r5.geb67e9a
pkgrel=2
pkgdesc="mpd albums randomizing script"
arch=('any')
url="https://github.com/$_gitauthor/$_gitname"
license=('unknown')
depends=('python' 'python-mpd2')
makedepends=('git')
provides=('mpdrandom')
source=('git+https://github.com/axujen/mpdrandom' 'mpdrandom.service')
md5sums=('SKIP' '6a7b6b63bb1ce777372deac19f420b2e')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix="$pkgdir/usr"

  install -Dm644 "$srcdir/mpdrandom.service" "$pkgdir/usr/lib/systemd/user/mpdrandom.service"
}

# vim:set ts=2 sw=2 et:
