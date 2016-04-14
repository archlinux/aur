# Maintainer: SanskritFritz (gmail)

pkgname=iprange-git
_gitname=iprange
pkgver=v1.0.2.r11.gab6eb9e
pkgrel=2
pkgdesc="Manage IP ranges. From the FireHOL project."
url="http://firehol.org/"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('glibc')
makedepends=('git' 'help2man')
provides=('iprange')
conflicts=('iprange')
source=("$_gitname::git+https://github.com/firehol/iprange")

pkgver() {
	cd "$_gitname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_gitname"

	./autogen.sh
	./configure --enable-maintainer-mode --prefix="/usr" --sysconfdir="/etc" --sbindir="/usr/bin"
	make
}

package() {
	cd "$_gitname"

	make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" sbindir="$pkgdir/usr/bin" install
}

md5sums=('SKIP')
