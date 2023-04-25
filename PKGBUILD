# Maintainer: Tpaefawzen <GitHub: Tpaefawzen>

pkgname=parsrs-git
pkgver=r139.81c3593
pkgrel=1
pkgdesc="CSV, JSON, XML parsers/generators written in pure POSIX shellscript"
arch=('any')
url="https://github.com/ShellShoccar-jpn/Parsrs"
license=('Unlicense' 'custom:CC0')
depends=('git')
groups=('shellshoccar-jpn')
provides=("parsrs")
source=("${pkgname}::git+https://github.com/ShellShoccar-jpn/Parsrs.git")
md5sums=('SKIP')

_pkgname=${pkgname%-git}

pkgver() {
	cd "$srcdir/$pkgname"

	# nothing ever tagged yet!
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"

	# executables
	_bins=(convx2j.sh
		escj.sh
		makrc.sh
		makrj.sh
		makrx.sh
		parsrc.sh
		parsrj.sh
		parsrt.sh
		parsrx.sh
		unescj.sh
		xpathread.sh)
	install -dm755 "$pkgdir/usr/bin/"
	install -Dm755 ${_bins[@]} "$pkgdir/usr/bin/"

	# documents
	install -dm755 "$pkgdir/usr/share/licenses/$_pkgname/"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/"

	## manuals
	_mans=(MAN/ja/makrj.sh.txt
		MAN/ja/parsrj.sh.txt
		MAN/ja/parsrx.sh.txt
		MAN/ja/unescj.sh.txt)
	install -dm755 "$pkgdir/usr/doc/$_pkgname/MAN/ja/"
	install -Dm644 ${_mans[@]} "$pkgdir/usr/doc/$_pkgname/MAN/ja/"
}
