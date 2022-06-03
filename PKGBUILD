## Maintainer: Speykious <speykious@gmail.com>

pkgname=figma-linux-bin
_pkgver=`cat current_version`
_appimage="figma-linux_${_pkgver}_linux_x86_64.AppImage"
pkgver=`echo "$_pkgver" | tr '\\:/\- ' '_'`
pkgrel=1
pkgdesc="The collaborative interface design tool. Unofficial Figma desktop client for Linux (AppImage)"
arch=(x86_64 aarch64)
url="https://github.com/Figma-linux/figma-linux"
license=(GPL2)
depends=()
provides=(figma-linux)
conflicts=(figma-linux)
options=(!strip)
source=(figma-linux.desktop
        24x24.png
        36x36.png
        48x48.png
        64x64.png
        72x72.png
        96x96.png
        128x128.png
        192x192.png
        256x256.png
        384x384.png
        512x512.png
        "https://github.com/Figma-linux/figma-linux/releases/download/v$_pkgver/$_appimage")

package() {
    install -Dm644 "$srcdir/figma-linux.desktop" "$pkgdir/usr/share/applications/figma-linux.desktop"
    install -Dm644 "$srcdir/256x256.png" "$pkgdir/usr/share/pixmaps/figma-linux.png"

    for size in 24 36 48 64 72 96 128 192 256 384 512; do
        install -Dm644 "$srcdir/${size}x${size}.png" \
               "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/figma-linux.png"
    done

	# Install binary
	install -Dm755 "$_appimage" "$pkgdir/usr/bin/figma-linux"

    # This is required for browser login to work
    xdg-mime default figma-linux.desktop x-scheme-handler/figma
}
