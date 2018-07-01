# Maintainer: Philipp A. <flying-sheep@web.de>
# Contibutor: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=sencha-cmd-6
pkgver=6.5.3.6
pkgrel=1
pkgdesc='Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks'
url='https://www.sencha.com/products/extjs/cmd-download/'
arch=(i686 x86_64)
license=('custom: commercial')
depends=('java-runtime<=8' ttf-font fontconfig)
provides=(sencha-cmd)
conflicts=(sencha-cmd sencha-cmd-5)
source_i686=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-i386.sh.zip")
source_x86_64=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-amd64.sh.zip")
sha512sums_i686=('594b05c2b7dfb2e4f6946a645c0984a16db9306d956643167e7412e1dc6f114385fee53495ca5ce4de06394f7655add584c14cc86bcd08c1bec9cd0d6a839ff0')
sha512sums_x86_64=('1f05ae494f029efa6831e5f745db74d11ae836fcbec4f95f1d45a7f389b7eb2c84612ac2e12f7d5e8675df5f8d17445b81beba24f4be202b4e745f860183565e')

build() {
	#tail -c 1397056  SenchaCmd-$pkgver.*-linux-amd64.sh > sfx_archive.tar.gz
	bash SenchaCmd-$pkgver-linux-amd64.sh -q \
		-Dall=true \
		-V'addToPath$Integer'=1 \
		-dir "$srcdir/$pkgname-$pkgver"
}

package() {
	install -d "$pkgdir/opt/Sencha"
	mv "$pkgname-$pkgver" "$pkgdir/opt/Sencha/Cmd"
	
	install -dm777 "$pkgdir/var/cache/sencha-repo"
	ln -s /var/cache/sencha-repo "$pkgdir/opt/Sencha/repo"
	
	install -d "$pkgdir/usr/bin/"
	ln -s /opt/Sencha/Cmd/sencha "$pkgdir/usr/bin/sencha"
}
