# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=php-cassandra-driver
_pkgname=cassandra
pkgver=1.0.0
pkgrel=1
pkgdesc="DataStax PHP Driver for Apache Cassandra"
arch=(i686 x86_64)
url="https://github.com/datastax/php-driver"
license=('Apache')
depends=('php' 'cassandra-cpp-driver>=2.0.0') 
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
sha256sums=('1c41281e014a0766b388c4e027856fa41a4d84254bc1950f0aa85511f90221dc')
