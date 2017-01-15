# Contributor: Richard Murri <admin@richardmurri.com> (snapshot version)
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-dvc
pkgver=595 # bzr revision number
pkgrel=1
pkgdesc="Common Emacs front-end for a number of distributed version control systems (currently arch, bazaar, git, mercurial, monotone)"
arch=('any')
url="http://download.gna.org/dvc/"
license=('GPL')
depends=('emacs')
provides=('emacs-dvc')
install=dvc.install
source=(http://download.gna.org/dvc/download/dvc-snapshot.tar.gz introdocs.patch)
md5sums=('be6c33e9ffbf5c3ec1698446624c4e16'
         '70288cd562860044c0aff5190d60db4f')

prepare() {
  cd "$srcdir"/dvc-snapshot/
  patch -Np1 < $srcdir/introdocs.patch
}

build() {
  cd "$srcdir"/dvc-snapshot
  ./configure --prefix="$pkgdir"/usr 
  make || true
}

package() {
  cd "$srcdir"/dvc-snapshot
  make DESTDIR=$pkgdir install
}
