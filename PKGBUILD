# Maintainer: Nikita Goncarenko <myftr12394 at gmail dot com>
# Co-maintainer: holaguz <agustin dot catellani at gmail dot com>
pkgname=tlescope-bin
pkgver=3.8.1
pkgrel=0
pkgdesc="TLEscope is a satellite visualization tool designed to transform Two-Line Element (TLE) sets into intuitive, interactive data."
arch=(x86_64)
url="https://github.com/aweeri/TLEscope"
license=('AGPL-3.0-only')
groups=()
depends=(base-devel git alsa-lib libx11 libxrandr libxi mesa glu libxcursor libxinerama wayland libxkbcommon curl)
makedepends=()
conflicts=(tlescope-git)
source=("https://github.com/aweeri/TLEscope/releases/latest/download/TLEscope-Linux-Portable.zip")
sha256sums=('SKIP')

package() {
	cd "$srcdir"
    
	install -d "$pkgdir/opt/TLEscope"
	cp -r TLEscope-Linux-Portable/* "$pkgdir/opt/TLEscope/"
	chmod 755 "$pkgdir/opt/TLEscope/TLEscope"
	install -d "$pkgdir/usr/local/bin"
	echo '#!/bin/sh' > "$pkgdir/usr/local/bin/TLEscope"
	echo 'USER_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/TLEscope"' >> "$pkgdir/usr/local/bin/TLEscope"
	echo 'mkdir -p "$USER_DIR"' >> "$pkgdir/usr/local/bin/TLEscope"
	echo 'ln -sfn "/opt/TLEscope/themes" "$USER_DIR/themes"' >> "$pkgdir/usr/local/bin/TLEscope"
	echo 'ln -sfn "/opt/TLEscope/logo.png" "$USER_DIR/logo.png"' >> "$pkgdir/usr/local/bin/TLEscope"
	echo 'if [ ! -f "$USER_DIR/settings.json" ] && [ -f "/opt/TLEscope/settings.json" ]; then cp "/opt/TLEscope/settings.json" "$USER_DIR/settings.json"; fi' >> "$pkgdir/usr/local/bin/TLEscope"
	echo 'if [ ! -f "$USER_DIR/data.tle" ] && [ -f "/opt/TLEscope/data.tle" ]; then cp "/opt/TLEscope/data.tle" "$USER_DIR/data.tle"; fi' >> "$pkgdir/usr/local/bin/TLEscope"
	echo 'cd "$USER_DIR" && exec "/opt/TLEscope/TLEscope" "$@"' >> "$pkgdir/usr/local/bin/TLEscope"
	chmod 755 "$pkgdir/usr/local/bin/TLEscope"
	install -d "$pkgdir/usr/share/applications"
	echo '[Desktop Entry]' > "$pkgdir/usr/share/applications/TLEscope.desktop"
	echo 'Type=Application' >> "$pkgdir/usr/share/applications/TLEscope.desktop"
	echo 'Name=TLEscope' >> "$pkgdir/usr/share/applications/TLEscope.desktop"
	echo 'Exec=TLEscope' >> "$pkgdir/usr/share/applications/TLEscope.desktop"
	echo 'Icon=/opt/TLEscope/logo.png' >> "$pkgdir/usr/share/applications/TLEscope.desktop"
	echo 'Terminal=false' >> "$pkgdir/usr/share/applications/TLEscope.desktop"
	echo 'Categories=Utility;Science;' >> "$pkgdir/usr/share/applications/TLEscope.desktop"
}
