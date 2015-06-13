# Contributor: SanskritFritz (gmail)

pkgname=alan-bzr
_pkgname=alan
pkgver=113
pkgrel=1
epoch=1
pkgdesc="Openbox menu framework. Comes by default with Semplice linux."
arch=('i686' 'x86_64')
url=https://launchpad.net/alan
license=('GPL')
depends=('python2' 'gnome-menus2')
makedepends=('bzr')
provides=('alan')
conflicts=('alan')
backup=('etc/alan/tree.conf')
source=("$_pkgname::bzr+http://bazaar.launchpad.net/~semplice-devs/alan/trunk/" 
        "bzr+http://bazaar.launchpad.net/~semplice-devs/semplice/laiv-setup/")
md5sums=('SKIP' 'SKIP')
install=alan.install

pkgver() {
  cd "$_pkgname"
  bzr revno
}

build() {
	cd "$srcdir/$_pkgname"
	python2 setup.py build

}

package() {
	cd "$srcdir/$_pkgname"
	python2 setup.py install --root "$pkgdir"

	install -dm755 "$pkgdir/usr/bin"
	ln -s "/usr/share/alan/alan-gentree.py" "$pkgdir/usr/bin/alan-gentree"
	ln -s "/usr/share/alan/alan-show-extension.py" "$pkgdir/usr/bin/alan-show-extension"

	install -Dm755 "$srcdir/laiv-setup/t9n/library.py" "$pkgdir/usr/lib/python2.7/site-packages/t9n/library.py"
	install -Dm755 "$srcdir/laiv-setup/t9n/__init__.py" "$pkgdir/usr/lib/python2.7/site-packages/t9n/__init__.py"

}
