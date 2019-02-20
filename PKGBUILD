# Maintainer: Philipp A. <flying-sheep@web.de>
# Contibutor: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=sencha-cmd-6
pkgver=6.7.0.37
pkgrel=2
pkgdesc='Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks'
url='https://www.sencha.com/products/extjs/cmd-download/'
arch=(i686 x86_64)
license=('custom: commercial')
depends=('java-runtime<=8' ttf-font fontconfig)
provides=(sencha-cmd)
conflicts=(sencha-cmd sencha-cmd-5)
source_i686=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-i386.sh.zip")
source_x86_64=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-amd64.sh.zip")
sha512sums_i686=('67a3b3d1d2217e7a11ec9d18114e22b36822d4a543f585bb88033a32a1405f836f2f0fd16c32e149fa72a44eda2407a9d4fbdf8ff40dcabe0060378e44b62bdd')
sha512sums_x86_64=('52417cc7b721c376352f96a1077abeb004fc1ff4cba80e91f2439e7d508d8ca32209960a04da6c22f3d2d26dd93b4dbb879c2a38b8226607191975fd8c43ebdf')

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
