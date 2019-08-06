# Maintainer: Cycloheptan <carl.schneider+archlinux@rub.de>
pkgname=phantombot
pkgver=3.0.0
pkgrel=1
pkgdesc="PhantomBot is a Twitch chat bot powered by Java."
arch=('x86_64')
url="https://phantombot.tv/"
license=('GPL3')
depends=('jre8-openjdk')
install=phantombot.install
source=("https://github.com/PhantomBot/PhantomBot/releases/download/v${pkgver}/PhantomBot-${pkgver}.zip"
	"phantombot.service")
md5sums=('946fa4b046822bcbc9dbbddd238f929c'
         'b9e8e8a3b567bc72f44b2192dacbd630')

prepare() {
	cd "$srcdir/PhantomBot-${pkgver}"
	sed -i '/^java /icd \/opt\/PhantomBot' launch.sh launch-service.sh
}

package() {
	cd "$srcdir/PhantomBot-${pkgver}"

	mkdir -p "$pkgdir/opt/PhantomBot";

	cp -r $srcdir/PhantomBot-${pkgver}/*/ "$pkgdir/opt/PhantomBot/";
	cp -r $srcdir/PhantomBot-${pkgver}/PhantomBot.jar "$pkgdir/opt/PhantomBot/";

	chmod -R 700 "$pkgdir/opt/PhantomBot";

	install -Dm0755 ./launch.sh "$pkgdir/usr/bin/phantombot";
	install -Dm0755 ./launch-service.sh "$pkgdir/usr/bin/phantombot-service";
	install -Dm0644 "$srcdir/phantombot.service" "$pkgdir/usr/lib/systemd/system/phantombot.service";
}
