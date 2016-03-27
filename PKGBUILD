# Maintainer: Jaume Delclòs <jaume@delclos.com>
pkgname=red-alien-git
pkgver=r138.02b53bb
pkgrel=1
pkgdesc="A script compiler and editor for Pokémon GBA ROMs"
arch=(any)
url="https://github.com/cosarara97/red-alien"
license=('GPL')
depends=('python' 'python-qscintilla-qt5' 'python-pyqt5' 'desktop-file-utils')
makedepends=('git')
options=(!emptydirs)
install=red-alien-git.install
source=('red-alien-git::git+https://github.com/cosarara97/red-alien.git')
md5sums=(SKIP)

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 utils/medicon.png $pkgdir/usr/share/pixmaps/red-alien.png
  install -D -m644 utils/red-alien.desktop $pkgdir/usr/share/applications/red-alien.desktop
  install -D -m644 utils/x-pks.xml $pkgdir/usr/share/mime/packages/x-pks.xml
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
