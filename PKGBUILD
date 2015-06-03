# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=3.25
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
sha256sums=('dce106162e300a8a3196299f4ff84e401dd9030fc970d63492cf58dec2d0f6fa')

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
