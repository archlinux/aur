# Maintainer: Your Name <your_email@example.com>
# Contributor: Contributor's Name <contributor_email@example.com>
pkgname=napture
pkgver=1.3.0
pkgrel=1
pkgdesc="Napture is a simple browser using a modified version of the http protocol called buss, it uses Lua instead of JavaScript and has support for most HTML and CSS tags, it uses a custom DNS found at api.buss.lol."
arch=('x86_64')
url="https://github.com/face-hh/webx"
license=('Apache2')
depends=('glib2' 'cargo' 'gtk4' 'libadwaita' 'lua' 'luajit')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')
build() {
    cd "$srcdir/webx/napture"
    cargo build --release
}

package() {
    cd "$srcdir/webx/napture"
    install -Dm755 "target/release/webx" "$pkgdir/usr/bin/napture"
    install -Dm644 "file.png" "$pkgdir/usr/share/pixmaps/napture.png"

	mkdir -p "$pkgdir/usr/share/applications"
	
    # Desktop entry
    cat << EOF > "$pkgdir/usr/share/applications/napture.desktop"
[Desktop Entry]
Name=Napture
Comment=Napture is a simple browser using a modified version of the http protocol called buss, it uses Lua instead of JavaScript and has support for most HTML and CSS tags, it uses a custom DNS found at api.buss.lol.
Exec=napture
Icon=napture
Type=Application
Categories=Internet;
EOF
}

# vim:set ts=2 sw=2 et:
