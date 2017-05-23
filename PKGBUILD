# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=sencha-cmd-6
pkgver=6.5.0
pkgrel=1
pkgdesc='Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks'
url='https://www.sencha.com/products/extjs/cmd-download/'
arch=(i686 x86_64)
license=(GPL)
depends=(java-runtime ttf-font)
provides=(sencha-cmd)
conflicts=(sencha-cmd sencha-cmd-5)
source_i686=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-i386.sh.zip")
source_x86_64=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-amd64.sh.zip")
sha512sums_i686=('139b099b2f6e9882fc6f167c68b439bc918312851397e25fcb88018e50a4c54d6921d6e9ae5106330884812d9bb582ae86d62a115f7d90482406ff130e0b4ef8')
sha512sums_x86_64=('9170a22be6c97b30785a30519e62d65930bb870e94eaae869eaaf2c5b366b3a377701d5f67890f27b3f56e9f98e64ac55fb2dc7c3e14078383fc1ad076a2f30b')

build() {
	bash SenchaCmd-$pkgver.*-linux-amd64.sh -q \
		-Dall=true \
		-VaddToPath=No \
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
