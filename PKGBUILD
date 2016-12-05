# Maintainer: Karel Koči <cynerd@email.cz>
pkgname=ttysterm
pkgver=20160921
pkgrel=1
pkgdesc="Simple serial terminal"
arch=('i686' 'x86_64')
url="https://rtime.felk.cvut.cz/gitweb/sojka/sterm.git"
license=('GPL3')
depends=('lockdev')
makedepends=('git')
#changelog="debian/changelog"
source=("$pkgname::git://rtime.felk.cvut.cz/sojka/sterm.git"
	"Fix-install-strip.patch"
	"known-lockdev-bug.patch")
md5sums=('SKIP'
		 'e37c9b06de817993830efe9e277e740c'
		 '5df1b7923840120638c8a5ee39ed9118')

prepare() {
	cd "$pkgname"
	# Reset to specified version
	git reset --hard $pkgver
	# Fix install strip
	patch -i $srcdir/Fix-install-strip.patch
	# Document known bug with lockdev and Systemd
	patch -i $srcdir/known-lockdev-bug.patch
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
