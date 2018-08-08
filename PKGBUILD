# Maintainer: Markus Schanz <coksnuss@googlemail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Steven <steven at stebalien dot com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>
pkgname=knockd-ipv6
pkgver=0.7.8
pkgrel=1
pkgdesc="Latest upstream version of knockd with added IPv6 support. Based on community/knockd."
arch=('any')
url="http://www.zeroflux.org/projects/knock"
license=('GPL2')
makedepends=('git')
provides=("knockd")
conflicts=("knockd")
backup=('etc/knockd.conf')
source=('git+https://github.com/Coksnuss/knock.git'
        'knockd.logrotate'
        'knockd.service')
md5sums=('SKIP'
         '3967caa58c2d1426776b412ea5895725'
         'a7d28c153484f50985b45eeb0780140b')

build() {
	cd "$srcdir/knock"
	autoreconf -fi
	./configure --prefix=/usr --sbin=/usr/bin --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/knock"
	make DESTDIR="$pkgdir/" install
	install -Dm 644 "${srcdir}/knockd.service" "${pkgdir}/usr/lib/systemd/system/knockd.service"
	install -Dm 644 "${srcdir}/knockd.logrotate" "${pkgdir}/etc/logrotate.d/knockd"
	install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
