# Maintainer: SelfRef <arch@selfref.dev>

_uuid=vibecheck@selfref.dev
pkgname=gnome-shell-extension-vibecheck-bin
pkgver=1.2.1
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
sha256sums=('1dcc330775a171411428345ccb39bad888d112320e40782e6063caf3902c07da')

package() {
	local _dest="$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	install -d "$_dest"
	bsdtar -xf "$pkgname-$pkgver.zip" -C "$_dest" --no-same-owner
	install -Dm644 "$_dest"/schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas"
	rm -r "$_dest/schemas"
	install -Dm644 "$_dest/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
