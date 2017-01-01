# Maintainer: Ben Fox-Moore <ben.foxmoore@gmail.com>
# Co-Maintainer: Sebastian Meyer <mail@bastimeyer.de>
pkgname=streamlink-twitch-gui
pkgver=1.1.1
pkgrel=1
pkgdesc="A multi platform Twitch.tv browser for Streamlink"
arch=("i686" "x86_64")
url="https://github.com/streamlink/streamlink-twitch-gui"
license=("MIT")
depends=(
	"alsa-lib"
	"gconf"
	"glib2"
	"gtk2"
	"libnotify"
	"libxtst"
	"nss"
	"xdg-utils"
)
optdepends=(
	"streamlink: streaming provider"
	"livestreamer: streaming provider (deprecated)"
)
provides=("streamlink-twitch-gui")
conflicts=("streamlink-twitch-gui-git")
options=(!strip)
install=$pkgname.install
source=("https://raw.githubusercontent.com/streamlink/streamlink-twitch-gui/master/LICENSE")
source_i686=("https://github.com/streamlink/streamlink-twitch-gui/releases/download/v$pkgver/streamlink-twitch-gui-v$pkgver-linux32.tar.gz")
source_x86_64=("https://github.com/streamlink/streamlink-twitch-gui/releases/download/v$pkgver/streamlink-twitch-gui-v$pkgver-linux64.tar.gz")
sha256sums=('a3f70e2c1fabdc05bde59f20d77863362d127b1c231c735a0422fa079c40415f')
sha256sums_i686=('2bf2185e36c6330d976e4d92cef38ff474a41d120d5a38efd10d8fa55b9d2b90')
sha256sums_x86_64=('e835dda9b9b1440c48e36691591e99a79d55aa8bff2a4c9b9778ab17688b06ec')

package() {
	cd "$srcdir/$pkgname"

	install -d "$pkgdir/opt/$pkgname"
	install -d "$pkgdir/usr/bin/"

	sed -i "s:Exec=\$HERE/start.sh:Exec=/usr/bin/$pkgname:g" add-menuitem.sh
	sed -i "s:CHECKNEWVERSIONS=true:CHECKNEWVERSIONS=false:g" start.sh

	cp -R * "$pkgdir/opt/$pkgname"

	ln -s "/opt/$pkgname/start.sh" "$pkgdir/usr/bin/$pkgname"
	ln -s "/usr/lib/libudev.so" "$pkgdir/opt/$pkgname/libudev.so.0"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
