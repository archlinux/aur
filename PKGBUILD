# Maintainer: Ratakor <contact@ratakor.com>

pkgname=quand-git
_pkgname="${pkgname%-git}"
pkgver=0.2
pkgver() { git -C "$_pkgname" describe --tags | sed 's/^v//;s/-/.r/;s/-/./g'; }
pkgrel=1
pkgdesc="A simple calendar written in POSIX sh"
arch=('any')
url="https://github.com/ratakor/$_pkgname"
license=('GPL')
depends=('coreutils' 'sh')
optdepends=('util-linux: use cal for c option')
provides=("$_pkgname")
source=("git+$url")
md5sums=('SKIP')

package() {
	cd "$srcdir/$_pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
