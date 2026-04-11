# Maintainer: Rain Xelelo <rxelelo@outlook.com>

_pkgname=BestClient
pkgname=bestclient
pkgver=1.4.3
pkgrel=1
pkgdesc="DDRaceNetwork modification that adds new feauters"
arch=('x86_64')
url=""
license=()
depends=('freetype2' 'opusfile' 'curl' 'glew' 'wavpack' 'ffmpeg' 'libnotify' 'miniupnpc' 'sqlite' 'mariadb-libs' 'vulkan-icd-loader')
checkdepends=('gmock')
optdepends=('ddnet-maps-git: All the maps used on the official DDNet Servers.'
	'discord-game-sdk: Enable rich presence in Discord desktop client.')
backup=('usr/share/ddnet/data/autoexec_server.cfg')
install="$pkgname.install"
source=("https://github.com/RoflikBEST/bestdownload/releases/download/v$pkgver/bestclient.tar.xz" "$pkgname.png")
sha256sums=('14e1b03583a7dfceff0371c168ce0e87d5d2a1bc81168212a2993984d6d3ea2d'
            'a118504f690407019294b39bea26920e2cddee94c032a1e5fae1ea216c9ea64f')

prepare() {
	mkdir -p $pkgname/game
	cp -r ${srcdir}/$pkgname-*-linux_x86_64/* $pkgname/game
	chmod +x $pkgname/game/DDNet
}

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a $pkgname "$pkgdir/opt/$pkgname"
	install -dm0755 "$pkgdir/usr/bin"
	install -dm0755 "$pkgdir/usr/share/applications/"
	cat >"$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
exec /opt/$pkgname/game/DDNet
EOF
	chmod +x $pkgdir/usr/bin/$pkgname
	cat >"$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Version=$pkgver
Name=$_pkgname
StartupNotify=true
TryExec=$pkgname
Exec=$pkgname
Terminal=false
Icon=/opt/$pkgname/$pkgname.png
Type=Application
Categories=Game
EOF
	install -Dm0644 "$srcdir/$pkgname.png" "$pkgdir/opt/$pkgname/$pkgname.png"
}
