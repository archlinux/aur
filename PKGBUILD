# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=php-cassandra-driver
_pkgname=php-driver
pkgver=1.0.0.beta
_pkgver=1.0.0-beta
pkgrel=1
pkgdesc="DataStax PHP Driver for Apache Cassandra"
arch=(i686 x86_64)
url="https://github.com/datastax/php-driver"
license=('Apache')
depends=('php' 'cassandra-cpp-driver>=2.0.0') 
source=("https://codeload.github.com/datastax/${_pkgname}/tar.gz/v$_pkgver")

build() {
	cd "$_pkgname-$_pkgver/ext"
    phpize
    ./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$_pkgver/ext"
    echo ';extension=cassandra.so' > cassandra.ini 
    install -Dm644 cassandra.ini "$pkgdir/etc/php/conf.d/cassandra.ini"
	make INSTALL_ROOT="$pkgdir/" install
}
md5sums=('3c93918f44c45f290a6dcfa385528475')
