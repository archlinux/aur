# Maintainer: Philipp A. <flying-sheep@web.de>
# Contibutor: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=sencha-cmd-6
pkgver=6.7.0.63
pkgrel=2
pkgdesc='Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks'
url='https://www.sencha.com/products/extjs/cmd-download/'
arch=(i686 x86_64)
license=('custom: commercial')
depends=('java-runtime=8' ttf-font fontconfig)
provides=(sencha-cmd)
conflicts=(sencha-cmd sencha-cmd-5)
source_i686=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-i386.sh.zip")
source_x86_64=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-amd64.sh.zip")
sha512sums_i686=('537716c2f55a380d26a907d8ffa8b45a414bdb0c94faaa441c36c61717c750fb860d4f725d3d7d0be7a5b9378587a148b5c022f10988bd5df6a5b709ce9be51c')
sha512sums_x86_64=('1fc43ae016b0d38be15f49fd02b2f14d8e605f3ff1c09fb569f991eb665b4ccaaf90132cf7df0751d0c72fc04b10eda8b238d6a6d7002692640653827305cc90')

build() {
	#tail -c 1397056  SenchaCmd-$pkgver.*-linux-amd64.sh > sfx_archive.tar.gz
	bash SenchaCmd-$pkgver*-linux-amd64.sh -q \
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
