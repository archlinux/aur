# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Uko Koknevics <perkontevs@gmail.com>
pkgname=tomenet
pkgver=4.7.1a
pkgrel=1
epoch=
pkgdesc="Middle-Earth based roguelike multiplayer"
arch=(i686 x86_64)
url="https://www.tomenet.eu/"
license=('custom:Moria' 'custom:TRACE' 'GPL' 'custom:Lua' 'BSD')
groups=()
depends=(bash perl sdl sdl_mixer)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.tomenet.eu/downloads/tomenet-4.7.1a.tar.bz2")
noextract=()
md5sums=("12d4b62fbfcf4b221009889af8a2dc11")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"/src
	make install
}

package() {
	cd "$pkgname-$pkgver"
	
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/opt/tomenet
	
	install -cs tomenet "$pkgdir"/opt/tomenet/tomenet
	rm -f "$pkgdir"/usr/bin/tomenet
	echo "#!/bin/bash" >> "$pkgdir"/usr/bin/tomenet
	echo "/opt/tomenet/tomenet" >> "$pkgdir"/usr/bin/tomenet
	chmod +x "$pkgdir"/usr/bin/tomenet
	
	install -cs tomenet.server "$pkgdir"/opt/tomenet/tomenet.server
	rm -f "$pkgdir"/usr/bin/tomenet.server
	echo "#!/bin/bash" >> "$pkgdir"/usr/bin/tomenet.server
	echo "/opt/tomenet/tomenet.server" >> "$pkgdir"/usr/bin/tomenet.server
	
	install -cs accedit "$pkgdir"/opt/tomenet/accedit
	rm -f "$pkgdir"/usr/bin/accedit
	echo "#!/bin/bash" >> "$pkgdir"/usr/bin/accedit
	echo "/opt/tomenet/accedit" >> "$pkgdir"/usr/bin/accedit
	
	touch "$pkgdir"/opt/tomenet/tomenet.acc
	
	mkdir -p "$pkgdir"/opt/tomenet/lib/config
	install -c -D ./lib/config/* "$pkgdir"/opt/tomenet/lib/config/
	
	mkdir -p "$pkgdir"/opt/tomenet/lib/data
	install -c -D ./lib/data/* "$pkgdir"/opt/tomenet/lib/config/
	
	mkdir -p "$pkgdir"/opt/tomenet/lib/game
	install -c -D ./lib/game/* "$pkgdir"/opt/tomenet/lib/game/
	
	mkdir -p "$pkgdir"/opt/tomenet/lib/save
	install -c -D ./lib/save/* "$pkgdir"/opt/tomenet/lib/save/
	
	mkdir -p "$pkgdir"/opt/tomenet/lib/scpt
	install -c -D ./lib/scpt/* "$pkgdir"/opt/tomenet/lib/scpt/
	
	mkdir -p "$pkgdir"/opt/tomenet/lib/text
	install -c -D ./lib/text/* "$pkgdir"/opt/tomenet/lib/text/
	
	mkdir -p "$pkgdir"/opt/tomenet/lib/user
	install -c -D ./lib/user/* "$pkgdir"/opt/tomenet/lib/user/
	
	mkdir -p "$pkgdir"/opt/tomenet/lib/xtra/music
	install -c -D ./lib/xtra/music/* "$pkgdir"/opt/tomenet/lib/xtra/music/
	
	mkdir -p "$pkgdir"/opt/tomenet/lib/xtra/sound
	install -c -D ./lib/xtra/sound/* "$pkgdir"/opt/tomenet/lib/xtra/sound/
	
	install -c ./lib/xtra/fonts-x11.txt "$pkgdir"/opt/tomenet/lib/xtra/fonts-x11.txt
	
	install -c ChangeLog "$pkgdir"/opt/tomenet/ChangeLog
	
	install -c changes.tpl "$pkgdir"/opt/tomenet/changes.tpl
	
	install -c changes.txt "$pkgdir"/opt/tomenet/changes.txt
	
	install -c runonce2 "$pkgdir"/opt/tomenet/tomenet-runonce2
	rm -f "$pkgdir"/usr/bin/tomenet-runonce2
	echo "#!/bin/bash" >> "$pkgdir"/usr/bin/tomenet-runonce2
	echo "/opt/tomenet/tomenet-runonce2" >> "$pkgdir"/usr/bin/tomenet-runonce2
	
	install -c runserv "$pkgdir"/opt/tomenet/tomenet-runserv
	rm -f "$pkgdir"/usr/bin/tomenet-runserv
	echo "#!/bin/bash" >> "$pkgdir"/usr/bin/tomenet-runserv
	echo "/opt/tomenet/tomenet-runserv" >> "$pkgdir"/usr/bin/tomenet-runserv
	
	install -c runserv3 "$pkgdir"/opt/tomenet/tomenet-runserv3
	rm -f "$pkgdir"/usr/bin/tomenet-runserv3
	echo "#!/bin/bash" >> "$pkgdir"/usr/bin/tomenet-runserv3
	echo "/opt/omenet/tomenet-runserv3" >> "$pkgdir"/usr/bin/tomenet-runserv3
	
	install -c tomenet.ini.default "$pkgdir"/opt/tomenet/tomenet.ini.default
	
	install -c TomeNET-Guide.txt "$pkgdir"/opt/tomenet/TomeNET-Guide.txt
	
	install -c zipit "$pkgdir"/opt/tomenet/zipit
	
	# license
	mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
	install -c COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
