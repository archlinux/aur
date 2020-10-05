# Maintainer: Ilya Fedin <ilya-fedin@outlook.com>

pkgname=libtgvoip
pkgver=2.4.4
pkgrel=6
pkgdesc="VoIP library for Telegram clients"
arch=(x86_64)
url="https://github.com/telegramdesktop/libtgvoip"
license=(Unlicense)
makedepends=(alsa-lib libpulse)
depends=(openssl opus)
optdepends=(
	'alsa-lib: for alsa support'
	'libpulse: for pulseaudio support'
)
_commit="7563a96b8f8e86b7a5fd1ce783388adf29bf4cf9"
source=(
	"https://github.com/telegramdesktop/libtgvoip/archive/${_commit}.zip"
	"https://github.com/telegramdesktop/libtgvoip/commit/11bc9089ad136b713190e0e8f5b484cba9ad495c.patch"
	"https://github.com/telegramdesktop/libtgvoip/commit/6e82b6e45664c1f80b9039256c99bebc76d34672.patch"
)

sha512sums=('0a38c88cc7c26049e7764e7ce9e91cda9c7381f76afccbe051aac52cd330d8c01cfab3c092a1a8e9b7296d4f4630b7b95a881bd98bd603db245df4cb5c8195e0'
            'f38c7dd4dde811adc619a1272ab5154201eac1afa31dea3cd990ef7a288dbff02d1bb59777d402643da095ee3085f3f584c56962c3c23bb234929c19dc70ef70'
            '250d4922e799ba7205b8f88609378dbb77ee74d67bf16dd4f46d9daba1b506878df66893838f023ed04fc7383439128215f67b45c0f302e7e41645c0c3f4346e')

prepare() {
	cd "$srcdir/$pkgname-${_commit}"
	patch -p1 < "$srcdir/11bc9089ad136b713190e0e8f5b484cba9ad495c.patch"
	patch -R -p1 < "$srcdir/6e82b6e45664c1f80b9039256c99bebc76d34672.patch"
}

build() {
	cd "$srcdir/$pkgname-${_commit}"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-${_commit}"
	make DESTDIR="$pkgdir" install
}
