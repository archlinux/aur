# Maintainder: samedamci <samedamci@disroot.org>
pkgname=rofi-keepassxc-git
pkgver=1.1.r3.d773f5e
pkgrel=1
pkgdesc="Simple keepassxc-cli frontend in rofi"
arch=('any')
url="https://github.com/samedamci/rofi-keepassxc"
license=('MIT')
depends=('rofi' 'xclip' 'keepassxc' 'zsh')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=("${pkgname%-git}")
source=("git+https://github.com/samedamci/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | cut -b 2-)"
}

package() {
	cd "$srcdir/${pkgname%-git}" || exit 1
	local doc_path="$pkgdir/usr/share/doc/${pkgname%-git}"

	install -Dm755 "rofi-keepassxc" "$pkgdir/usr/bin/${pkgname%-git}"

	install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname%-git}"

	install -Dm644 "README.md" "${doc_path}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
