# Maintainer: Bjarno Oeyen <aur _AT_ bjarno _DOT_ be>

pkgname=game-jolt-client
pkgrel=5
pkgver=0.13.2
pkgdesc="Play games. Make games. Stay indie."
url="http://gamejolt.com/client"
provides=('game-jolt-client')
arch=('x86_64')
license=('mit')
depends=('gtk2' 'alsa-lib' 'libnotify' 'gconf' 'nss' 'libxtst' 'nodejs')
makedepends=()
backup=()
install=''
source=("https://n3b6p5n5.ssl.hwcdn.net/data/client/releases/v0.13.2/game-jolt-client.tar.gz" "game-jolt-client.desktop" "package.json.new" "game-jolt.png" "APPLICENSE")
md5sums=('373310874384ade132cb449c300f9254'
         'fe8091dddcc53d89a91857cdadc9c1ba'
         '58402c3922fdce61dfd29c113e2496c5'
         '7da2ee98d8647bf2843ee1033f2c5374'
         'b0fd0e4afb5262c1c8792ad9fc671828')
options=(!strip)

prepare() {
  cd "$srcdir"
  mkdir -p "$srcdir"/unpacked
	tar -xzf game-jolt-client.tar --directory "$srcdir"/unpacked
}

package() {

	install -d "$pkgdir"/opt/game-jolt-client
	cp -R "$srcdir"/unpacked/* "$pkgdir"/opt/game-jolt-client

	find "$pkgdir"/opt/game-jolt-client -type f -exec chmod 644 {} \;
	chmod 755 "$pkgdir"/opt/game-jolt-client/game-jolt-client

	install -d "$pkgdir"/usr/bin
	ln -s ../../opt/game-jolt-client/game-jolt-client "$pkgdir"/usr/bin/game-jolt-client

	install -Dm644 "$srcdir"/APPLICENSE               "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir"/game-jolt-client.desktop "${pkgdir}/usr/share/applications/game-jolt-client.desktop"
	install -Dm644 "$srcdir"/game-jolt.png            "${pkgdir}/usr/share/pixmaps/game-jolt.png"
	install -Dm644 "$srcdir"/package.json.new         "${pkgdir}/opt/game-jolt-client/package.json"
}
