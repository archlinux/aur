# Maintainer: Your Name <your_email@example.com>
# Contributor: Contributor's Name <contributor_email@example.com>
pkgname=napture
pkgver=1.0.0
pkgrel=1
pkgdesc="A description of what Napture does"
arch=('x86_64')
url="https://github.com/face-hh/webx"
license=('MIT')
depends=('glib2' 'cargo')
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
    install -Dm644 "src/resources/settings.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/settings.gschema.xml"

	mkdir -p "$pkgdir/usr/share/applications"
	
    # Desktop entry
    cat << EOF > "$pkgdir/usr/share/applications/napture.desktop"
[Desktop Entry]
Name=Napture
Exec=napture
Icon=napture
Type=Application
Categories=Utility;
EOF
}

# vim:set ts=2 sw=2 et:
