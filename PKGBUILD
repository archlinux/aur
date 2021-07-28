# Author: Axujen <axujen@gmail.com>
# Maintainer: ZaZam <zazaamm at gmail dot com>

_gitauthor=axujen
_gitname=mpdrandom
pkgname=mpdrandom-git
pkgver=1.3.0.r2.gf96680a
pkgrel=1
pkgdesc="mpd albums randomizing script"
arch=('any')
url="https://github.com/$_gitauthor/$_gitname"
license=('GPL3')
depends=('python' 'python-mpd2')
makedepends=('git' 'python-setuptools')
provides=('mpdrandom')
source=("git+https://github.com/$_gitauthor/$_gitname" 'mpdrandom.service')
sha1sums=('SKIP' '155133e127d3d935d339cff2265a5f728a4ef0b1')

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
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "$srcdir/mpdrandom.service" "$pkgdir/usr/lib/systemd/user/mpdrandom.service"
}

# vim:set ts=2 sw=2 et:
