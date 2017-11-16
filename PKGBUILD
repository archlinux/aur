# Maintainer: 吕海涛 <aur@lvht.net>

pkgname=php-zookeeper
_extname=zookeeper
pkgver=0.4.0
pkgrel=1
pkgdesc="PHP extension for interfacing with Apache ZooKeeper"
arch=("i686" "x86_64")
url="https://github.com/php-zookeeper/php-zookeeper"
license=('PHP')
depends=('php' 'libzookeeper')
source=("http://pecl.php.net/get/$_extname-$pkgver.tgz")
backup=("etc/php/conf.d/$_extname.ini")
packager="吕海涛 <aur@lvht.net>"

build() {
	cd "$srcdir/$_extname-$pkgver"
	phpize
	./configure
	make
}

package() {
	cd "$srcdir/$_extname-$pkgver"
	install -m0755 -d "$pkgdir/etc/php/conf.d/"
	install -m0644 -D "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	echo "extension=$_extname.so" > "$pkgdir/etc/php/conf.d/$_extname.ini"
	chmod 0644 "$pkgdir/etc/php/conf.d/$_extname.ini"
	install -m0755 -D ".libs/$_extname.so" "$pkgdir$(php-config --extension-dir)/$_extname.so"
}

sha256sums=('de319a28534485f13e4b84db6cb2e5abf41c1549653caf65276fa87dc391b2a9')
