# Maintainer: Bart Libert <bart plus aur at libert dot email>
pkgname=pass-menu-git
pkgver=r11.b862cb0
pkgrel=2
pkgdesc="Simple Frontend for Password Store, for fzf, dmenu and similar"
arch=('any')
url="https://github.com/bartlibert/pass-menu"
license=('MIT')
depends=('bash' 'findutils' 'pass')
makedepends=('git' 'make')
optdepends=('libnotify: notification support'
	'oath-toolkit: generating OTP codes'
	'xclip: clipboard support on X11'
	'xdotool: autofill support on X11'
	'wl-clipboard: clipboard support on wayland'
	'wtype: autofill support on wayland'
	)
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
