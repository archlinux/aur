# Maintainer: jtaw5649 <213313463+jtaw5649 at users dot noreply dot github dot com>
pkgname=omarchy-workspace-manager
pkgver=1.2.4
pkgrel=1
pkgdesc="Paired dual-monitor workspace management for Hyprland"
arch=('any')
url="https://github.com/jtaw5649/omarchy-workspace-manager"
license=('MIT')
depends=('hyprland' 'jq' 'socat')
install=omarchy-workspace-manager.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d4a080ae0420e0d764417c924b11c4a78191c73e380a366fc6bfb712fedd5ab2')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/share/$pkgname"
	cp -r lib config "$pkgdir/usr/share/$pkgname/"

	install -Dm755 bin/omarchy-workspace-manager "$pkgdir/usr/share/$pkgname/bin/omarchy-workspace-manager"

	install -dm755 "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/omarchy-workspace-manager" <<'EOF'
#!/usr/bin/env bash
export OWM_ROOT="/usr/share/omarchy-workspace-manager"
export OWM_CONFIG_PATH="${OWM_CONFIG_PATH:-$HOME/.config/omarchy-workspace-manager/paired.json}"
exec "$OWM_ROOT/bin/omarchy-workspace-manager" "$@"
EOF
	chmod 755 "$pkgdir/usr/bin/omarchy-workspace-manager"

	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
