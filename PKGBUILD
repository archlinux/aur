# Maintainer: SanskritFritz (gmail)

pkgname=anamnesis-bzr
_pkgname=anamnesis
pkgver=59
pkgrel=2
epoch=1
pkgdesc="Clipboard manager that stores all clipboard history and offers an interface to do a full-text search."
arch=('i686' 'x86_64')
url=http://anamnesis.sourceforge.net/
license=('GPL')
depends=('pygtk' 'python2-xdg' 'sqlite3')
optdepends=('xclip: for clipboard_implementation=gtk_xclip')
makedepends=('bzr')
provides=('anamnesis')
conflicts=('anamnesis')
backup=('usr/share/anamnesis/anamnesis.cfg')
source=("$_pkgname::bzr://$_pkgname.bzr.sourceforge.net/bzrroot/$_pkgname/")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  bzr revno
}

package() {
        install -dm755 "$pkgdir"/usr/share/{anamnesis,doc/anamnesis,man/man1}
	install -dm755 "$pkgdir/usr/bin"

	cd "$srcdir/$_pkgname/source"
	for srcfile in $(ls *); do
		install -m644 "$srcfile" "$pkgdir/usr/share/anamnesis"
	done

	cd "$srcdir/$_pkgname/"
        install -m644 anamnesis.cfg "$pkgdir/usr/share/anamnesis"

        install -m644 ChangeLog "$pkgdir/usr/share/doc/anamnesis"
        install -m644 COPYING "$pkgdir/usr/share/doc/anamnesis"
        install -m644 README "$pkgdir/usr/share/doc/anamnesis"

	install -m644 man/* "$pkgdir/usr/share/man/man1"

	chmod +x "$pkgdir/usr/share/anamnesis/anamnesis.py"
	sed -i "s/python/python2/" "$pkgdir/usr/share/anamnesis/anamnesis.py"
	ln -s "/usr/share/anamnesis/anamnesis.py" "$pkgdir/usr/bin/anamnesis"
}

