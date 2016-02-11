# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=php-cassandra-driver
_pkgname=cassandra
pkgver=1.1.0
pkgrel=1
pkgdesc="DataStax PHP Driver for Apache Cassandra"
arch=(i686 x86_64)
url="https://github.com/datastax/php-driver"
license=('Apache')
depends=('php' 'cassandra-cpp-driver>=2.2.2') 
backup=('etc/php/conf.d/cassandra.ini')

source=(
    http://pecl.php.net/get/${_pkgname}-${pkgver}.tgz
)

build() {
	cd "$_pkgname-$pkgver"
    phpize
    ./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	echo ';extension=cassandra.so' > cassandra.ini 
	install -Dm644 cassandra.ini "$pkgdir/etc/php/conf.d/cassandra.ini"
	make INSTALL_ROOT="$pkgdir/" install
}
sha256sums=('e9f196bad4d2d64a0ef5be113d855db85c662c36ae7a23644c2573adb01b854a')
