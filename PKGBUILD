# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=3.22
pkgrel=1
pkgdesc="Performs surgery on version control repositories."
arch=('any')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('python2')
makedepends=('asciidoc' 'xmlto')
optdepends=('bzr'
            'cvs-fast-export'
            'darcs'
            'fossil'
            'git'
            'mercurial'
            'src'
            'subversion')
source=($url$pkgname-$pkgver.tar.gz)
sha256sums=('66f366fc92d908fd68717cfb86eade989b7f550481b2e055803fd400805d1b14')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install

  install -dm755 "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 reposurgeon-mode.el "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 conversion.mk "$pkgdir/usr/share/doc/reposurgeon"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}

# vim:set ts=2 sw=2 et:
