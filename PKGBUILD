# Author: Axujen <axujen@gmail.com>
# Maintainer: ZaZam <zazaamm at gmail dot com>
# Co-Maintainer: Cedric Girard <cgirard [dot] archlinux [at] valinor [dot] fr>

_gitauthor=axujen
_gitname=mpdrandom
pkgname=mpdrandom-git
pkgver=1.3.0.r4.gacc37ed
pkgrel=2
pkgdesc="mpd albums randomizing script"
arch=('any')
url="https://github.com/$_gitauthor/$_gitname"
license=('GPL3')
depends=('python' 'python-mpd2')
makedepends=('git' 'python-setuptools')
optdepends=('mpd: provides mpd user for system unit')
provides=('mpdrandom')
source=("git+https://github.com/$_gitauthor/$_gitname" 'mpdrandom-user.service' 'mpdrandom-system.service')
sha1sums=('SKIP'
          '155133e127d3d935d339cff2265a5f728a4ef0b1'
          '2728b8b70264c98b763050953d46ce3680d7791d')

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

  install -Dm644 "$srcdir/mpdrandom-user.service" "$pkgdir/usr/lib/systemd/user/mpdrandom.service"
  install -Dm644 "$srcdir/mpdrandom-system.service" "$pkgdir/usr/lib/systemd/system/mpdrandom.service"
}

# vim:set ts=2 sw=2 et:
