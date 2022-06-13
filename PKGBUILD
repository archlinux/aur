# Maintainer: Luke Arms <luke@arms.to>

pkgname=devilspie2-git
_pkgname=${pkgname%-git}
pkgver=v0.44.r13.g9153e70
pkgrel=1
pkgdesc="A window matching utility, allowing the user to perform scripted actions on windows as they are opened and closed."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/$_pkgname/"
license=('GPL3')
depends=('lua>=5.1' 'gtk3' 'libwnck3')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
# Alternative: https://git.savannah.gnu.org/git/$_pkgname.git
source=("git+https://github.com/dsalt/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" PREFIX=/usr install

	# Install documentation
	mkdir -p -m755 "$pkgdir/usr/share/doc"
	cp -Rp doc/ "$pkgdir/usr/share/doc/$pkgname"
	install -Dp -m644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim: set ft=sh ts=4 sw=4 noet:
