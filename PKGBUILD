# Maintainer: Ben Fox-Moore <ben.foxmoore@gmail.com>
pkgname=streamlink-twitch-gui
pkgver=1.0.0
pkgrel=2
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
	"streamlink"
	"xdg-utils"
)
provides=("streamlink-twitch-gui")
conflicts=("streamlink-twitch-gui-git")
options=(!strip)
install=$pkgname.install
source=("https://raw.githubusercontent.com/streamlink/streamlink-twitch-gui/master/LICENSE")
source_i686=("https://github.com/streamlink/streamlink-twitch-gui/releases/download/v$pkgver/streamlink-twitch-gui-v$pkgver-linux32.tar.gz")
source_x86_64=("https://github.com/streamlink/streamlink-twitch-gui/releases/download/v$pkgver/streamlink-twitch-gui-v$pkgver-linux64.tar.gz")
md5sums=('0b62e5d2cf76f19fea17c82c1a56c583')
md5sums_i686=('2ed3e4686af9de4c0b0ba85498595f34')
md5sums_x86_64=('5c5a6c7ee710752e9b2938ed9b1f1c30')

package() {
	cd "$srcdir/$pkgname"

	install -d "$pkgdir/opt/$pkgname"
	install -d "$pkgdir/usr/bin/"

	sed -i "s:Exec=\$HERE/start.sh:Exec=/usr/bin/$pkgname:g" add-menuitem.sh
	sed -i "s:CHECKNEWVERSIONS=true:CHECKNEWVERSIONS=false:g" start.sh

	cp -R * "$pkgdir/opt/$pkgname"

	chmod -R g+r,o+r "$pkgdir/opt/$pkgname"

	ln -s "/opt/$pkgname/start.sh" "$pkgdir/usr/bin/$pkgname"
	ln -s "/usr/lib/libudev.so" "$pkgdir/opt/$pkgname/libudev.so.0"

	install -d "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
