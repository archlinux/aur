# Maintainer: Alexis Rossfelder <rossfelderalexis@gmail.com>
pkgname=hermes-webui-desktop-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Cross-platform desktop shell for Hermes WebUI, the web interface for Hermes Agent"
arch=('x86_64')
url="https://github.com/hermes-webui/hermes-desktop-rust"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=('hermes-webui-desktop')
conflicts=('hermes-webui-desktop')
options=('!strip')
source=("hermes-webui-desktop-${pkgver}.deb::https://github.com/hermes-webui/hermes-desktop-rust/releases/download/v${pkgver}/Hermes.WebUI.Desktop_${pkgver}_lin_x86_64.deb")
sha256sums=('e939304701c689a88a241c805077f69ca9bea819d0def7a3af893c0359002a7d')
noextract=("hermes-webui-desktop-${pkgver}.deb")

package() {
	bsdtar -xf "$srcdir/hermes-webui-desktop-${pkgver}.deb" -C "$srcdir" data.tar.gz
	bsdtar -xf "$srcdir/data.tar.gz" -C "$pkgdir"

	find "$pkgdir/usr" -type d -exec chmod 755 {} \;
	find "$pkgdir/usr" -type f -exec chmod 644 {} \;
	chmod 755 "$pkgdir/usr/bin/hermes-webui-desktop"

	mv "$pkgdir/usr/share/applications/Hermes WebUI Desktop.desktop" "$pkgdir/usr/share/applications/hermes-webui-desktop.desktop"
}
