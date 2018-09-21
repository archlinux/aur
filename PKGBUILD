# Maintainer: hashworks <mail@hashworks.net>

pkgname=goaccess-git
pkgrel=2
pkgver=r2768.2789816
pkgdesc='GoAccess is a real-time web log analyzer and interactive viewer that runs in a terminal in *nix systems or through your browser.'
url='https://goaccess.io'
license=('MIT')
arch=('any')
conflicts=('goaccess')
provides=('goaccess')
depends=('ncurses')
optdepends=('geoip: Provides a mmdb geoip database')
backup=('etc/goaccess.conf')
source=('git+https://github.com/allinurl/goaccess.git')
md5sums=('SKIP')

pkgver() {
	cd "goaccess"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "goaccess"
	autoreconf -fiv
	./configure --prefix="$pkgdir/usr" --enable-utf8 --enable-geoip=mmdb
	make
	make sysconfdir="$pkgdir/etc" install
}
