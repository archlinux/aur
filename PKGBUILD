# Maintainer: Matthieu Valleton <mvalleton@seos.fr>

pkgname=emma-git
pkgver=r93.4437721
pkgrel=1
pkgdesc="A platform-independent mysql administrator frontend using python and gtk+ (git version with various fixes)"
arch=('i686' 'x86_64')
url="https://github.com/seeschloss/emma"
license=("GPL")
depends=('python2' 'pygtk' 'mysql-python')
makedepends=('git')
optdepends=('python2-sqlparse: pretty formatting')
provides=('emma')
source=('emma::git+https://github.com/seeschloss/emma.git')
sha1sums=('SKIP')

pkgver() {
  cd $srcdir/emma
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/emma
  python2 setup.py install --root=$pkgdir --optimize=1
  mkdir -p $pkgdir/usr/share/{applications,pixmaps}
  install -m644 $srcdir/emma/emma.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/emma/icons/emma.png $pkgdir/usr/share/pixmaps/
}

# vim:set ts=2 sw=2 et:
