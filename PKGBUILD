# aintainer: Al1nuX <your-email@example.com>
pkgname=i3-resurrect-auto
pkgver=1.0.0
pkgrel=1
pkgdesc="Automatically save and restore i3 workspaces on shutdown/startup"
arch=('any')
url="https://github.com/CryptLabs/i3-resurrect-auto"
license=('MIT')
depends=('bash' 'i3-resurrect')
optdepends=(
	'rofi: for rofi menu integration'
	'libnotify: for desktop notifications'
)
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/CryptLabs/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f89c383dbcf5a248c6b301cc2904eeaac4b2890d0b7033f62a8251230ccc9983')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# Install main scripts to /usr/bin
	install -Dm755 scripts/save-workspaces.sh "$pkgdir/usr/bin/i3-resurrect-save"
	install -Dm755 scripts/restore-workspaces.sh "$pkgdir/usr/bin/i3-resurrect-restore"
	install -Dm755 scripts/i3-resurrect-rofi.sh "$pkgdir/usr/bin/i3-resurrect-rofi"
	install -Dm755 scripts/i3-resurrect-rofi-simple.sh "$pkgdir/usr/bin/i3-resurrect-rofi-simple"

	# Install default config to /usr/share
	install -Dm644 scripts/config.sh "$pkgdir/usr/share/$pkgname/config.sh"

	# Install documentation
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
