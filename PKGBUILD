# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=dahdi
_project="$pkgname-linux-complete"
pkgver=3.1.0
pkgrel=1
pkgdesc='DAHDI drivers for Asterisk'
arch=(x86_64)
url=http://www.asterisk.org
license=(GPL2)
depends=(libusb
         'linux<5.5'
         perl)
makedepends=('linux-headers<5.5')
conflicts=(zaptel)
install="$pkgname.install"
_archive="$_project-$pkgver+$pkgver"
source=("http://downloads.asterisk.org/pub/telephony/$_project/releases/$_archive.tar.gz"
        "$pkgname.service")
sha256sums=('30d8cfcbef9c3b6d7064df5dad7e9b752a9f635ee73c95d5e2931c5e46cc9f40'
            '7c91314aacab22ffd02794abfa7db49f44a796ea54f3e2bc4276616e68b90e0f')
build() {
	cd "$_archive"
	make DESTDIR="$pkgdir" all
}

package() {
	cd "$_archive"
	make DYNFS=1 DESTDIR="$pkgdir" install
}
