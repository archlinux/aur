# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=3.8
pkgrel=1
pkgdesc="Performs surgery on version control repositories."
arch=('any')
url="http://www.catb.org/esr/reposurgeon/"
license=('BSD')
depends=('python2')
makedepends=('asciidoc' 'xmlto')
optdepends=('bzr'
            'cvs-fast-export'
            'darcs'
            'git'
            'mercurial'
            'subversion')
source=(http://www.catb.org/~esr/reposurgeon/$pkgname-$pkgver.tar.gz)
sha256sums=('1e815613a9e87dde97245312885d347cd3f65ba064710bafaa05607c005e50b2')

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
