# Maintainer: Jocadbz <madureirajoaquim95@gmail.com>
# Maintainer: RedsonBr <redson@riseup.com>

pkgname=redfetch-git
_pkgname=redfetch
pkgver=r0.g000649b
pkgrel=1
pkgdesc="A fast fetch written in C, with the ppfetch Ascii Art."
arch=('x86_64')
url="https://codeberg.org/redson/Redfetch"
license=('MIT')
makedepends=('gcc' 'make' 'git')
depends=('wmctrl')
provides=('redfetch')
source=("$_pkgname::git+https://codeberg.org/redson/redfetch.git")
sha256sums=('SKIP') # We can't verify the git build every time

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --tags --long | sed -r -e 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}	
	
build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 redfetch "$pkgdir/usr/bin/redfetch"
	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
