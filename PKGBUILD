_npmname=http-master
pkgname=nodejs-http-master # All lowercase
pkgver=1.2.7
pkgrel=2
pkgdesc="a front end http service with with easy setup of reverse proxy/redirecting/other-actions logic"
arch=(any)
url="https://github.com/encharm/http-master"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('8bc58d1a293a7be51401612acd034561ff16d14b')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
	mkdir -p "$pkgdir/etc/systemd/system"
        mkdir -p "$pkgdir/etc/http-master"
        cp "$pkgdir/usr/lib/node_modules/http-master/http-master-upstart.conf" "$pkgdir/etc/http-master/http-master.conf"
        cp "$pkgdir/usr/lib/node_modules/http-master/http-master.service" "$pkgdir/etc/systemd/system/."

#    rmdir "$pkgdir/usr/etc"
}
