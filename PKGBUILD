# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=eagle
pkgname=$_pkgname-git
pkgver=r15.6f673c2
pkgrel=1
pkgdesc="XMPP eagle Application"
arch=('x86_64' 'i686')
url="https://pages.codeberg.org/eagle/"
license=('GPL3')
depends=('libstrophe' 'glib2' 'gpgme' 'gtk3' 'libvc')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('eagle::git+https://codeberg.org/eagle/eagle.git'
	'release-mode.diff')
md5sums=('SKIP'
         'b8bc92ebfd51c8bde4fd256dc57d7116')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"

	patch -Np1 < "$srcdir/release-mode.diff"
}

build() {
	cd "$srcdir/$_pkgname"
	./bootstrap.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
}
