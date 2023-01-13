# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=spim
pkgname="$_pkgname-svn"
pkgver=latest
pkgrel=1
pkgdesc='A MIPS32 simulator (SVN version)'
arch=('i686' 'x86_64')
url='https://spimsimulator.sourceforge.net/'
license=('custom:BSD')
groups=('emulators')
depends=('glibc')
makedepends=('subversion')
conflicts=("$_pkgname")
provides=("$_pkgname")

source=("$_pkgname::svn+https://svn.code.sf.net/p/spimsimulator/code/")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname/$_pkgname"
	local ver="$(svnversion)"
	printf '%s' "${ver//[[:alpha:]]}"
}

build() {
	cd "$srcdir/$_pkgname/$_pkgname"
	make
}

check() {
	cd "$srcdir/$_pkgname/$_pkgname"
	make test
}

package() {
	provides=("$_pkgname-$pkgver")

	cd "$srcdir/$_pkgname/$_pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 README "$pkgdir/usr/share/licenses/$pkgname/README"
}
