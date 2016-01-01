# Maintainer: Bart De Vries <devriesb@gmail.com>

pkgname=snapcast
pkgver=0.4.0
pkgrel=1
pkgdesc="Synchronous multi-room audio player"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/badaix/snapcast"
license=('GPL')
groups=()
depends=(boost-libs alsa-lib avahi libvorbis flac)
makedepends=(git boost alsa-utils)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/badaix/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}-systemd.patch")
noextract=()
md5sums=('ee13041c5e8a9b84fc00b03ba4d713cf'
         '156ea081ab151786ca8e508636f07f45')
validpgpkeys=()

prepare() {
        cd "$pkgname-$pkgver"
        patch -p1 -i "$srcdir/$pkgname-systemd.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 -g root -o root server/snapserver ${pkgdir}/usr/bin/snapserver
	install -Dm644 -g root -o root server/snapserver.1 ${pkgdir}/usr/share/man/man1/snapserver.1

	install -Dm755 -g root -o root client/snapclient ${pkgdir}/usr/bin/snapclient
	install -Dm644 -g root -o root client/snapclient.1 ${pkgdir}/usr/share/man/man1/snapclient.1

	install -Dm644 -g root -o root init.scripts/systemd/snapserver.service ${pkgdir}/usr/lib/systemd/system/snapserver.service
	install -Dm644 -g root -o root init.scripts/systemd/snapclient.service ${pkgdir}/usr/lib/systemd/system/snapclient.service
}

