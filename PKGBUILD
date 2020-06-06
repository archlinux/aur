# Maintainer: hashworks <mail@hashworks.net>

pkgname=goaccess-git
pkgrel=1
pkgver=v1.4.r7.ge462ba08
pkgdesc='A real-time web log analyzer and interactive viewer that runs in a terminal in *nix systems or through your browser.'
url='https://goaccess.io'
license=('MIT')
arch=('x86_64')
conflicts=('goaccess')
provides=('goaccess')
depends=('ncurses' 'libmaxminddb' 'openssl')
optdepends=('geoip2-database: for geoip support')
makedepends=('git')
backup=('etc/goaccess/goaccess.conf' 'etc/goaccess/browsers.list' 'etc/goaccess/podcast.list')
source=('git+https://github.com/allinurl/goaccess.git')
sha256sums=('SKIP')

pkgver() {
	cd "goaccess"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "goaccess"
	autoreconf -fiv
	./configure --enable-geoip=mmdb --enable-utf8 --with-openssl --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "goaccess"
	make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install
}
