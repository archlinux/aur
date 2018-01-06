# Maintainer:  twa022 <twa022 at gmail dot com>
# Based on sencha-cmd-6 PKGBUILD by
# Contributor: Philipp A. <flying-sheep@web.de>
# Contributor: Mathieu OTHACEHE <m.othacehe@gmail.com>

_pkgname=sencha-cmd-6
pkgname=${_pkgname}.1
pkgver=6.1.3
pkgrel=1
pkgdesc='Sencha Cmd provides a collection of powerful, time-saving features that work together and in conjunction with the Sencha Ext JS and Sencha Touch frameworks (6.1.x release)'
url='https://www.sencha.com/products/extjs/cmd-download/'
arch=('i686' 'x86_64')
license=('custom: commercial')
depends=(java-runtime ttf-font fontconfig)
provides=("sencha-cmd=${pkgver}" "sencha-cmd-6=${pkgver}")
conflicts=('sencha-cmd')
source_i686=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-i386.sh.zip")
source_x86_64=("http://cdn.sencha.com/cmd/$pkgver/no-jre/SenchaCmd-$pkgver-linux-amd64.sh.zip")
sha512sums_i686=('275a692e11a9896b1dbddd4a8cdbc6a1a5d62272d6705d6f985d04f94a1031d537956c613272b218f161af7b3006bfb406bca58f9ae5c3d9557a2868de619786')
sha512sums_x86_64=('d59889fe79148417876aa8133f3d997d683977d1895b76a17544ab27e8986198430579c3686ee2c6e24e96fe7268a315a6d1f7d49f533f910497a8d000764e75')

build() {
	#tail -c 1397056  SenchaCmd-$pkgver.*-linux-amd64.sh > sfx_archive.tar.gz
	bash SenchaCmd-$pkgver.*-linux-amd64.sh -q \
		-Dall=true \
		-V'addToPath$Integer'=1 \
		-dir "$srcdir/$_pkgname-$pkgver"
}

package() {
	install -d "$pkgdir/opt/Sencha"
	mv "$_pkgname-$pkgver" "$pkgdir/opt/Sencha/Cmd"
	
	install -dm777 "$pkgdir/var/cache/sencha-repo"
	ln -s /var/cache/sencha-repo "$pkgdir/opt/Sencha/repo"
	
	install -d "$pkgdir/usr/bin/"
	ln -s /opt/Sencha/Cmd/sencha "$pkgdir/usr/bin/sencha"
}
