# Maintainer: Maximilian Jeschek <max@jeschek.dev>
pkgname=tintty
pkgver=0.1.2
pkgrel=1
pkgdesc="Tiny native Wayland terminal emulator — full Unicode beyond U+FFFF at urxvt-level RAM"
arch=('x86_64' 'aarch64')
url="https://github.com/maxischmaxi/tintty"
license=('MIT')
depends=('wayland' 'libxkbcommon' 'freetype2' 'fontconfig' 'pixman')
makedepends=('wayland-protocols' 'pkgconf')
optdepends=('ttf-firacode-nerd: einkompilierter Standard-Font'
            'ttf-nerd-fonts-symbols-mono: Nerd-Font-Icon-Fallback'
            'noto-fonts-emoji: Emoji-Fallback')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('44de7586a83c7da927a66ac2788d42632454da86c93643f287443e6794442404')

build() {
	cd "$pkgname-$pkgver"
	make VERSION="$pkgver" PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make VERSION="$pkgver" DESTDIR="$pkgdir" PREFIX=/usr install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
