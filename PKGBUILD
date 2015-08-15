# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=indicator-keylock
pkgver=3.0.2
pkgrel=1
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
md5sums=('8e9f20e25cdadaf5ccc8174e3b60bcf4')

prepare() {
	cd "$pkgname-$pkgver"
	# the tarball is plain from the repository, without configure
	./autogen.sh
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--disable-schemas-compile
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
