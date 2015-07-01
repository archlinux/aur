#Maintainer: K.Hampf <khampf@users.sourceforge.net>
pkgname=freeguide
pkgver=0.11.1
pkgrel=2
pkgdesc="A free TV guide program written in Java"
arch=('i686' 'x86_64')
url="http://freeguide-tv.sourceforge.net"
license=('GPL2')
depends=('java-runtime' 'xmltv')
makedepends=('apache-ant' 'java-environment')
source=("http://downloads.sourceforge.net/freeguide-tv/$pkgname-$pkgver.tar.gz")
md5sums=('ee924fab9b81ea84456ce9800ed06a9c')

build() {
	cd "$pkgname-$pkgver"
	[ -z "$ANT_HOME" ] && . /etc/profile.d/apache-ant.sh

	ant
}
package() {
	cd "$pkgname-$pkgver"
	[ -z "$ANT_HOME" ] && . /etc/profile.d/apache-ant.sh
	
	install -d "$pkgdir/usr/share/applications"
	ant -Dinstall_share_dir="$pkgdir/usr/share" \
		-Dinstall_bin_dir="$pkgdir/usr/bin" \
		-Dinstall_real_dir=/usr/share/freeguide install
	install -Dm644 "install/linux/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
