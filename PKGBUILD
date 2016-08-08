# Maintainer: Ben Fox-Moore <ben.foxmoore@gmail.com>
pkgname=livestreamer-twitch-gui
pkgver=v0.14.2
pkgrel=1
pkgdesc="A multi platform Twitch.tv browser for Livestreamer"
arch=("i686" "x86_64")
url="https://github.com/bastimeyer/livestreamer-twitch-gui"
license=("MIT")
depends=(
	"alsa-lib"
	"gconf"
	"gtk2"
	"libnotify"
	"libxtst"
	"livestreamer"
	"nss"
	"xorg-xwininfo"
	"xdg-utils"
)
provides=("livestreamer-twitch-gui")
conflicts=("livestreamer-twitch-gui-git")
options=(!strip)
install=$pkgname.install
source=("https://raw.githubusercontent.com/bastimeyer/livestreamer-twitch-gui/master/LICENSE")
source_i686=("https://github.com/bastimeyer/livestreamer-twitch-gui/releases/download/$pkgver/livestreamer-twitch-gui-$pkgver-linux32.tar.gz")
source_x86_64=("https://github.com/bastimeyer/livestreamer-twitch-gui/releases/download/$pkgver/livestreamer-twitch-gui-$pkgver-linux64.tar.gz")
md5sums=('0b62e5d2cf76f19fea17c82c1a56c583')
md5sums_i686=('3beef471bce3ef08b665235ab1985924')
md5sums_x86_64=('4e08dca3513577e0b8da0d4336c19d80')

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
