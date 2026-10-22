# Maintainer: SelfRef <arch@selfref.dev>

_uuid=vibecheck@selfref.dev
pkgname=gnome-shell-extension-vibecheck-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="GNOME Shell extension showing remaining Claude plan usage in the top bar and on a desktop card"
arch=('any')
url="https://github.com/SelfRef/vibecheck"
license=('MIT')
depends=('gnome-shell')
optdepends=('claude-code: usage data source and sign-in')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/$_uuid.shell-extension.zip")
noextract=("$pkgname-$pkgver.zip")
sha256sums=('807e2ad2715470063f4eca7d8cdeea4b7e886b7f5b8b9a7d2b7f673779066f04')

package() {
	local _dest="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	install -d "$_dest"
	bsdtar -xf "$pkgname-$pkgver.zip" -C "$_dest" --no-same-owner
	install -Dm644 "$_dest"/schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas"
	rm -r "$_dest/schemas"
	install -Dm644 "$_dest/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
