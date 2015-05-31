# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=3.24
pkgrel=1
pkgdesc="Performs surgery on version control repositories."
arch=('i686' 'x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('python2')
makedepends=('cython2' 'asciidoc' 'xmlto')
optdepends=('bzr'
            'cvs-fast-export'
            'darcs'
            'fossil'
            'git'
            'mercurial'
            'src'
            'subversion')
source=($url$pkgname-$pkgver.tar.gz)
sha256sums=('7f784d41bebcf728f1e423158df1c20c99702fdb4ce95e45298cf24d5c119811')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make CYTHON=cython2 all cyreposurgeon
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install install-cyreposurgeon

  install -dm755 "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 reposurgeon-mode.el "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}

# vim:set ts=2 sw=2 et:
