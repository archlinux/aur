# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=php-cassandra-driver
_pkgname=cassandra
pkgver=1.3.0
pkgrel=1
pkgdesc="DataStax PHP Driver for Apache Cassandra"
arch=(i686 x86_64)
url="https://github.com/datastax/php-driver"
license=('Apache')
depends=('php' 'cassandra-cpp-driver>=2.4.2')
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
sha256sums=('d87cab8a1d28b5e5028f23849974ef845c3e4b971fd7c64518447a7f2d38fb6d')
