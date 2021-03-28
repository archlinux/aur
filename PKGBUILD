# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=indicator-keylock
pkgver=3.1.0
pkgrel=2
pkgdesc="An indicator that displays the status of the keyboard lock keys"
arch=('x86_64' 'i686')
url="https://launchpad.net/indicator-keylock/"
license=('GPL3')
depends=('gconf' 'libappindicator-gtk3' 'libunique3' 'libnotify' 'libx11'
	'desktop-file-utils' 'gtk-update-icon-cache')
makedepends=()
optdepends=('notification-daemon: for notificiations')
backup=()
options=()
install=indicator-keylock.install
source=("http://archive.ubuntu.com/ubuntu/pool/universe/i/$pkgname/${pkgname}_$pkgver.tar.xz")
md5sums=('8d2f55978eac2f637f73a5c06c295607')

prepare() {
	cd "$pkgname-$pkgver"
	# the tarball is plain from the repository, without configure
	./autogen.sh
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--disable-schemas-compile \
    CC=g++ \
    CFLAGS='-fpermissive'
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
