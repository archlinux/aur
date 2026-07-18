# Maintainer: Rain Xelelo <rxelelo@outlook.com>

pkgname=rhythia-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Aim-based rhythm game client, built in Godot 4"
arch=('x86_64')
url="https://github.com/Rhythia/Client"
license=()
depends=(unzip)
checkdepends=('gmock')
source=("$url/releases/download/$pkgver/Linux.zip" "rhythia.png")
sha256sums=('439dd947814da027b658cfc1e2dd16767f471883fc445d0a06ac70c9ded1c162'
	'80bced3710e63542395556e92b5fdddfeb728b8f847d00d5c38bc688284fd1c9')

package() {
	install -dm0755 "$pkgdir/opt"
	install -dm0755 "$pkgdir/opt/rhythia-bin"
	cd "$pkgdir/opt/rhythia-bin"
	unzip $srcdir/Linux.zip
	install -dm0755 "$pkgdir/usr/bin"
	install -dm0755 "$pkgdir/usr/share/applications/"
	chmod +x $pkgdir/opt/$pkgname/Rhythia.x86_64

	cat >"$pkgdir/usr/bin/rhythia" <<EOF
#!/bin/bash
exec /opt/$pkgname/Rhythia.x86_64
EOF
	chmod +x $pkgdir/usr/bin/rhythia
	cat >"$pkgdir/usr/share/applications/rhythia-bin.desktop" <<EOF
[Desktop Entry]
Version=$pkgver
Name=Rhythia
StartupNotify=true
TryExec=rhythia
Exec=rhythia
Terminal=false
Icon=/opt/$pkgname/rhythia.png
Type=Application
Categories=Game
EOF
	install -Dm0644 "$srcdir/rhythia.png" "$pkgdir/opt/$pkgname/rhythia.png"
}
