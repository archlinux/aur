# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=2.30
pkgrel=1
pkgdesc="Performs surgery on version control repositories."
arch=('any')
url="http://www.catb.org/esr/reposurgeon/"
license=('BSD')
depends=('python2')
makedepends=('xmlto')
optdepends=('bzr'
            'cvs-fast-export'
            'darcs'
            'git'
            'mercurial'
            'subversion')
source=(http://www.catb.org/~esr/reposurgeon/$pkgname-$pkgver.tar.gz)
sha256sums=('f137e0b7092172000877fadbd9b35cf020f0894ef4285a8feb4a857549abadea')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e '1s/python/python2/' repodiffer reposurgeon
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install

  install -dm755 "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 reposurgeon-mode.el "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}

# vim:set ts=2 sw=2 et:
