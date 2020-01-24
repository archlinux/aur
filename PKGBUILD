# Maintainer: Ilya Fedin <ilya-fedin@outlook.com>

pkgname=libtgvoip
pkgver=2.4.4
pkgrel=4
pkgdesc="VoIP library for Telegram clients"
arch=(x86_64)
url="https://github.com/telegramdesktop/libtgvoip"
license=(Unlicense)
depends=(openssl opus)
optdepends=(
	'alsa-lib: for alsa support'
	'libpulse: for pulseaudio support'
)
_commit="ade4434f1c6efabecc3b548ca1f692f8d103d22a"
source=(
	"https://github.com/telegramdesktop/libtgvoip/archive/${_commit}.zip"
)

sha512sums=('b7f7175cdfd9f4a015d1b7c65bf73b8074695ac1699ee9caf420e5efa3c262f969b657a5ed482400e0ae173880b416f9ac9da76c0321b224f1f5058074474713')

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
