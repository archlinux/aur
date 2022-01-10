pkgname=amttool-tng
pkgver=1.7.4
pkgrel=1
pkgdesc="Utility to manage Intel AMT-aware devices (fork of Gerd Hoffmann's AMTTOOL)"
arch=('any')
url="https://sourceforge.net/projects/$pkgname/"
license=('GPL2')
depends=('perl' 'perl-soap-lite')
source=("https://downloads.sourceforge.net/$pkgname/1.7/amttool"
        "https://downloads.sourceforge.net/$pkgname/1.7/README.txt"
        "https://downloads.sourceforge.net/$pkgname/1.7/amt_traps_v1.4.sh")
sha256sums=('2757bff657af5f27cb5ca09988217d4fc10c62b3edff0d2a9b5e9443868fdb1c'
            'a5cb476f9d3d61f0f9221dab6c727e487af8c77d4321635cbace60f97ec7b4d9'
            '488e40077c2657fa237229532124fac12e96984408ec666c3243633db96efc86')

build() {
	cd "$srcdir"

	sed -e 's|/path/to/amttool|/usr/bin/amttool|' \
	    -e "s|/path/to/file/amt_traps.sh|/usr/share/$pkgname/amt_traps.sh|" \
	    -i amt_traps_v1.4.sh
}

package() {
	cd "$srcdir"
	install -Dp -m755 amttool "$pkgdir/usr/bin/$pkgname"
	install -Dp -m644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
	install -Dp -m755 amt_traps_v1.4.sh "$pkgdir/usr/share/$pkgname/amt_traps.sh"
	mkdir -p "$pkgdir/var/log/amt"
}

# vim: set ft=sh ts=4 sw=4 noet:
