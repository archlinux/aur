# Maintainer: Cycloheptan <carl.schneider+archlinux@rub.de>
pkgname=phantombot
pkgver=2.3.8
pkgrel=4
pkgdesc="PhantomBot is a Twitch chat bot powered by Java."
arch=('x86_64')
url="https://phantombot.tv/"
license=('GPL3')
depends=('jre8-openjdk')
install=phantombot.install
source=("https://github.com/PhantomBot/PhantomBot/releases/download/v${pkgver}/PhantomBot-${pkgver}.zip"
	"phantombot"
	"phantombot-service"
	"phantombot.service")
md5sums=("31ff8f531d63e1345f17daee8cb04276"
	"ec15a1aba305e13767dd111c95d7c8ea"
	"38ffacee5eb87f1c864368338ebf0ae8"
	"b9e8e8a3b567bc72f44b2192dacbd630")

package() {
	mkdir -p "$pkgdir/opt/PhantomBot";

	cp -r $srcdir/PhantomBot-${pkgver}/*/ "$pkgdir/opt/PhantomBot/";
	cp -r $srcdir/PhantomBot-${pkgver}/PhantomBot.jar "$pkgdir/opt/PhantomBot/";

	chmod -R 700 "$pkgdir/opt/PhantomBot";

	install -Dm0755 "$srcdir/phantombot" "$pkgdir/usr/bin/phantombot";
	install -Dm0755 "$srcdir/phantombot-service" "$pkgdir/usr/bin/phantombot-service";
	install -Dm0644 "$srcdir/phantombot.service" "$pkgdir/usr/lib/systemd/system/phantombot.service";
}
