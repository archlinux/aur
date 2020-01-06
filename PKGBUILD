# Maintainer: Ilya Fedin <ilya-fedin@outlook.com>

pkgname=libtgvoip
pkgver=2.4.4
pkgrel=3
pkgdesc="VoIP library for Telegram clients"
arch=(x86_64)
url="https://github.com/telegramdesktop/libtgvoip"
license=(Unlicense)
depends=(openssl opus)
optdepends=(
	'alsa-lib: for alsa support'
	'libpulse: for pulseaudio support'
)
_commit="88b47b6f808f2573d4eaf37e1463ecd59c43deda"
source=(
	"https://github.com/telegramdesktop/libtgvoip/archive/${_commit}.zip"
	"libtgvoip-use-pkgconfig.patch"
)

sha512sums=('38dc34d6ce197d7dfaf06b5bef305fb7099586c14aa2a0142f0cd0f6bca2fdd96e23be22f00ae195a7e89e08c2a6a6f36c1a618e8e4eeb50a507f266c1b4ae21'
            '70b97446c5bb89cf6b6d2ebfb43ad88172d7e41481b4cd2ad6fd800b403bb432b1e68d022141e288c556046e5bd8c802788c6d69ac242cbc90d900d76ac8ae74')

prepare() {
	cd "$srcdir/$pkgname-${_commit}"
	patch -Np1 -i "$srcdir/libtgvoip-use-pkgconfig.patch"
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
