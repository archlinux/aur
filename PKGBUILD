# Maintainer: Ben Fox-Moore <ben.foxmoore@gmail.com>
# Co-Maintainer: Sebastian Meyer <mail@bastimeyer.de>
pkgname=streamlink-twitch-gui
pkgver=1.3.1
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
	"streamlink"
)
provides=("streamlink-twitch-gui")
conflicts=("streamlink-twitch-gui-git")
options=(!strip)
install=$pkgname.install
source=("https://raw.githubusercontent.com/streamlink/streamlink-twitch-gui/master/LICENSE")
source_i686=("https://github.com/streamlink/streamlink-twitch-gui/releases/download/v$pkgver/streamlink-twitch-gui-v$pkgver-linux32.tar.gz")
source_x86_64=("https://github.com/streamlink/streamlink-twitch-gui/releases/download/v$pkgver/streamlink-twitch-gui-v$pkgver-linux64.tar.gz")
sha256sums=('a3f70e2c1fabdc05bde59f20d77863362d127b1c231c735a0422fa079c40415f')
sha256sums_i686=('9ab3d004d0dc1ddfd94b93e0ffb8600a19fc0413befeca8b56f6f018d71d91f1')
sha256sums_x86_64=('06bf0e4516f189fa686b935a9455b8129d3113115c531f0bfcb9b9927422b5a6')

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
