# Maintainer: Buce <dmbuce@gmail.com>

pkgname=imgur-cli-svn
pkgver=4
pkgver() {
  cd "$srcdir/$pkgname"
  svnversion | tr -d [A-z]
}
pkgrel=3
pkgdesc="A command-line client for imgur."
arch=(any)
url="http://code.google.com/p/imgur-cli/"
license=('GPL3')
depends=('python2')
makedepends=('subversion')
provides=(imgur-cli)
conflicts=(imgur-cli)
replaces=()
source=('imgur.py-fix-edit-album.patch' # http://code.google.com/p/imgur-cli/issues/detail?id=3
        "$pkgname::svn+http://imgur-cli.googlecode.com/svn/trunk/")
md5sums=('5ad8a9a5e96f20f346e756771638abbf'
         'SKIP')

build() {
  cd "$srcdir/$pkgname"

  #
  # BUILD HERE
  #
  sed -i '1 s/python/python2/' imgur.py
  patch -p0 <"$srcdir/imgur.py-fix-edit-album.patch"
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 imgur.py "$pkgdir/usr/bin/imgur"
}

# vim:set ts=2 sw=2 et:
