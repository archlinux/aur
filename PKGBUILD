# Maintainer: Cycloheptan <carl.schneider+archlinux@rub.de>
pkgname=phantombot
pkgver=3.4.2
pkgrel=1
pkgdesc="PhantomBot is a Twitch chat bot powered by Java."
arch=('x86_64')
url='https://phantombot.github.io/PhantomBot/'
license=('GPL3')
depends=('jre-openjdk')
install=phantombot.install
source=("https://github.com/PhantomBot/PhantomBot/releases/download/v${pkgver}/PhantomBot-${pkgver}.zip"
	"phantombot.service")
md5sums=('a0dd11990470bcc5566a9c169bc9e368'
         'b9e8e8a3b567bc72f44b2192dacbd630')

package() {
	cd "$srcdir/PhantomBot-${pkgver}"

	install -d "${pkgdir}/opt/PhantomBot" "${pkgdir}/usr/bin"

	cp -r $srcdir/PhantomBot-${pkgver}/*/ "$pkgdir/opt/PhantomBot/";
	install -m0644 -t "$pkgdir/opt/PhantomBot/" "$srcdir/PhantomBot-${pkgver}/"PhantomBot.jar
	install -m0755 -t "$pkgdir/opt/PhantomBot/" "$srcdir/PhantomBot-${pkgver}/"{launch.sh,launch-service.sh}

	ln -s ../../opt/PhantomBot/launch.sh "$pkgdir/usr/bin/phantombot"
	ln -s ../../opt/PhantomBot/launch-service.sh "$pkgdir/usr/bin/phantombot-service"
	install -Dm0644 "$srcdir/phantombot.service" "$pkgdir/usr/lib/systemd/system/phantombot.service";
}
