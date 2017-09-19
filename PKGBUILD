# Maintainer: Philipp A. <flying-sheep@web.de>
# Contibutor: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=sencha-cmd-6
pkgver=6.5.1
pkgrel=1
pkgdesc='Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks'
url='https://www.sencha.com/products/extjs/cmd-download/'
arch=(i686 x86_64)
license=('custom: commercial')
depends=(java-runtime ttf-font fontconfig)
provides=(sencha-cmd)
conflicts=(sencha-cmd sencha-cmd-5)
source_i686=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-i386.sh.zip")
source_x86_64=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-amd64.sh.zip")
sha512sums_i686=('c7f4ab6112e398e24e003f64dd2a851c70436aba4c07c3d6dfac65cdeea603f8ba2cef783cddba7d357f161d74a190db46417b2642e4b3cd5a8d8a24c9b71abd')
sha512sums_x86_64=('c528eca3dfa325657543fca60a8e5563b17f9c7215dfc5038ad54032dc4dbdfd1348b624e7e36ecc3d512bc01f186704e56bc0310dc4c0b6dbff87be63098d19')

build() {
	#tail -c 1397056  SenchaCmd-$pkgver.*-linux-amd64.sh > sfx_archive.tar.gz
	bash SenchaCmd-$pkgver.*-linux-amd64.sh -q \
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
