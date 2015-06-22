# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=php-cassandra-driver-git 
_pkgname=php-driver
pkgver=1.0.0.beta.r21.g3a8614e
pkgrel=1
pkgdesc="DataStax PHP Driver for Apache Cassandra - Git version"
arch=(x86_64 i686)
url="https://github.com/datastax/php-driver"
license=('Apache')
depends=('cassandra-cpp-driver>=2.0.0' 'php')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/datastax/php-driver.git)
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/${_pkgname%}/ext"
	# Strip "v" prefix
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_pkgname%}/ext"
	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${_pkgname%}/ext"
	make INSTALL_ROOT="$pkgdir/" install
}
