# Maintainer: Cycloheptan <carl.schneider+archlinux@rub.de>
pkgname=phantombot
pkgver=2.3.8
pkgrel=1
pkgdesc="PhantomBot is a Twitch chat bot powered by Java."
arch=('x86_64')
url="https://phantombot.tv/"
license=('GPL3')
depends=('java-runtime')
install=phantombot.install
backup=("opt/PhantomBot/botlogin.txt"
	"opt/PhantomBot/phantombot.db"
	"opt/PhantomBot/phantombot.db-journal")
source=("https://github.com/PhantomBot/PhantomBot/releases/download/v${pkgver}/PhantomBot-${pkgver}.zip"
	"phantombot"
	"phantombot-service"
	"phantombot.service")
md5sums=("31ff8f531d63e1345f17daee8cb04276"
	"b15be553d777c8b87d79d8551f4cd639"
	"ba89682a452ffbfc23efb5c11b9f2158"
	"b9e8e8a3b567bc72f44b2192dacbd630")

package() {
	mkdir -p "$pkgdir/opt/PhantomBot";

	cp -r $srcdir/PhantomBot-${pkgver}/*/ "$pkgdir/opt/PhantomBot/";
	cp -r $srcdir/PhantomBot-${pkgver}/PhantomBot.jar "$pkgdir/opt/PhantomBot/";

	chmod -R 755 "$pkgdir/opt/PhantomBot";

	install -Dm0755 "$srcdir/phantombot" "$pkgdir/usr/bin/phantombot";
	install -Dm0755 "$srcdir/phantombot-service" "$pkgdir/usr/bin/phantombot-service";
	install -Dm0644 "$srcdir/phantombot.service" "$pkgdir/usr/lib/systemd/system/phantombot.service";
}
