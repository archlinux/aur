# Maintainer: Ilya Fedin <ilya-fedin@outlook.com>

pkgname=libtgvoip
pkgver=2.4.4
pkgrel=5
pkgdesc="VoIP library for Telegram clients"
arch=(x86_64)
url="https://github.com/telegramdesktop/libtgvoip"
license=(Unlicense)
depends=(openssl opus)
optdepends=(
	'alsa-lib: for alsa support'
	'libpulse: for pulseaudio support'
)
_commit="e422d2a80546a32ab7166a9b1058bacfc5daeefc"
source=(
	"https://github.com/telegramdesktop/libtgvoip/archive/${_commit}.zip"
)

sha512sums=('798cddf2a39f6cffa47b195002a4f21e15b514b8a1aca27a4cb431d53e433cb0930885c10075ad8735bca01bec88c8d1a7c25d6eb3714b1a8d09f12dda877a9f')

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
