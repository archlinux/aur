# Maintainer: Daniele Paolella <danpaolella@gmail.com>
pkgname=hg-fast-export
_pkgname=fast-export
pkgver=190913
pkgrel=1
pkgdesc="Mercurial to git converter using git-fast-import"
arch=('any')
url="https://repo.or.cz/fast-export.git"
license=('MIT' 'GPL2')
depends=('python2')
changelog=$pkgname.changelog
source=("https://github.com/frej/fast-export/archive/v$pkgver.tar.gz")
md5sums=('17d558219b8e3db19a821bca19f7a4d7')

prepare() {
	sed -i '1s/python$/python2/' "$srcdir/$_pkgname-$pkgver/hg-reset.py"
}

package() {
	install -D -m 755 {"$srcdir/$_pkgname-$pkgver","$pkgdir/usr/share/hg-fast-export"}/hg-fast-export.py
	install -D -m 755 {"$srcdir/$_pkgname-$pkgver","$pkgdir/usr/share/hg-fast-export"}/hg-fast-export.sh
	install -D -m 755 {"$srcdir/$_pkgname-$pkgver","$pkgdir/usr/share/hg-fast-export"}/hg-reset.py
	install -D -m 755 {"$srcdir/$_pkgname-$pkgver","$pkgdir/usr/share/hg-fast-export"}/hg-reset.sh
	install -D -m 755 {"$srcdir/$_pkgname-$pkgver","$pkgdir/usr/share/hg-fast-export"}/hg2git.py
	install -D -m 644 {"$srcdir/$_pkgname-$pkgver","$pkgdir/usr/share/hg-fast-export"}/pluginloader/__init__.py
	install -D -m 644 {"$srcdir/$_pkgname-$pkgver","$pkgdir/usr/share/hg-fast-export"}/plugins/branch_name_in_commit/__init__.py
	install -D -m 644 {"$srcdir/$_pkgname-$pkgver","$pkgdir/usr/share/hg-fast-export"}/plugins/dos2unix/__init__.py
	install -D -m 644 {"$srcdir/$_pkgname-$pkgver","$pkgdir/usr/share/hg-fast-export"}/plugins/shell_filter_file_contents/__init__.py

	install -d "$pkgdir/usr/share/licenses/hg-fast-export"
	sed -n '/Legal/,/mit-license.php/p' "$srcdir/$_pkgname-$pkgver/README.md" > "$pkgdir/usr/share/licenses/hg-fast-export/LICENSE"

	install -d "$pkgdir/usr/bin"
	ln -s /usr/share/hg-fast-export/hg-fast-export.py "$pkgdir/usr/bin"
	ln -s /usr/share/hg-fast-export/hg-fast-export.sh "$pkgdir/usr/bin"
	ln -s /usr/share/hg-fast-export/hg-reset.py "$pkgdir/usr/bin"
	ln -s /usr/share/hg-fast-export/hg-reset.sh "$pkgdir/usr/bin"
	ln -s /usr/share/hg-fast-export/hg2git.py "$pkgdir/usr/bin"
}
