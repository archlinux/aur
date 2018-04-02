# Maintainer: disarmer <disarmer.mk@gmail.com>
pkgname='https-dns-proxy-git'
pkgver=1
pkgrel=1
arch=('x86_64')
url='https://github.com/aarond10/https_dns_proxy'
license=('MIT')
makedepends=('cmake' 'c-ares' 'libev')
source=('git://github.com/aarond10/https_dns_proxy.git' https_dns_proxy.service)
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "${srcdir}/https_dns_proxy"
	printf '0.r%s.g%s' "$(git rev-list --count master)" "$(git log -1 --format='%h')"
}

build() {
	cd "${srcdir}/https_dns_proxy"
	cmake .
	make
}
package() {
	cd "${srcdir}/https_dns_proxy"
	install -dm755 $pkgdir/usr/bin/ $pkgdir/usr/lib/systemd/system/
	install -m 755 https_dns_proxy $pkgdir/usr/bin/
	install -Dm 644 ${srcdir}/https_dns_proxy.service $pkgdir/usr/lib/systemd/system/
}
