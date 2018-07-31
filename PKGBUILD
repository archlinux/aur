# Maintainer: Bart De Vries <devriesb@gmail.com>

pkgname=snapcast
pkgver=0.15.0
pkgrel=2
pkgdesc="Synchronous multi-room audio player"
arch=('x86_64' 'armv6h' 'armv7h')
url="https://github.com/badaix/snapcast"
license=('GPL')
depends=(alsa-lib avahi libvorbis flac)
makedepends=(alsa-utils asio aixlog popl)
backup=('etc/default/snapserver' 'etc/default/snapclient')
install=snapcast.install
source=("https://github.com/badaix/snapcast/archive/v${pkgver}.tar.gz")
sha256sums=('7c584fad4941a299339fe060174e33c4d810b1cbe80d6efbee54da3dafb252cc')

prepare() {
        cd "${pkgname}-${pkgver}"
}

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 -g root -o root server/snapserver "${pkgdir}/usr/bin/snapserver"
	install -Dm644 -g root -o root server/snapserver.1 "${pkgdir}/usr/share/man/man1/snapserver.1"

	install -Dm755 -g root -o root client/snapclient "${pkgdir}/usr/bin/snapclient"
	install -Dm644 -g root -o root client/snapclient.1 "${pkgdir}/usr/share/man/man1/snapclient.1"

	install -Dm644 -g root -o root server/debian/snapserver.service "${pkgdir}/usr/lib/systemd/system/snapserver.service"
	install -Dm644 -g root -o root server/debian/snapserver.default "${pkgdir}/etc/default/snapserver"
	install -Dm644 -g root -o root client/debian/snapclient.service "${pkgdir}/usr/lib/systemd/system/snapclient.service"
	install -Dm644 -g root -o root client/debian/snapclient.default "${pkgdir}/etc/default/snapclient"
}

