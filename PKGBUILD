# Maintainer: hashworks <mail@hashworks.net>

pkgname=goaccess-git
pkgrel=8
pkgver=r2768.2789816
pkgdesc='GoAccess is a real-time web log analyzer and interactive viewer that runs in a terminal in *nix systems or through your browser.'
url='https://goaccess.io'
license=('MIT')
arch=('any')
conflicts=('goaccess')
provides=('goaccess')
depends=('ncurses' 'libmaxminddb' 'openssl')
optdepends=('geoip: Provides a mmdb geoip database')
backup=('etc/goaccess.conf')
source=('git+https://github.com/allinurl/goaccess.git')
md5sums=('SKIP')

pkgver() {
	cd "goaccess"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "goaccess"
	autoreconf -fiv
	./configure --prefix=/usr --enable-utf8 --enable-geoip --sysconfdir=/etc --with-openssl
	make
}

package() {
	cd "goaccess"
	make prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install
}
