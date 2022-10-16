# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=buteo
pkgname=$_pkgname-git
pkgver=r10.1762c37
pkgrel=1
epoch=1
pkgdesc="A XMPP based Groupware application"
arch=('x86_64' 'i686')
url="https://buteo.codeberg.page/"
license=('GPL3')
depends=('gtkmm3' 'libstrophe' 'boost-libs')
makedepends=('git' 'autoconf-archive' 'libtool' 'boost')
provides=("$_pkgname")
conflicts=("$_pkgname" 'eagle-xmpp-git')
replaces=('eagle-xmpp-git')
source=("$_pkgname::git+https://codeberg.org/buteo/buteo.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
