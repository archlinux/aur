# Maintainer: zlowly <zlowly@gmail.com>
pkgname=smartdns-git
_pkgname=${pkgname%-git}
pkgver=r319.3ad7cd7
pkgrel=1
pkgdesc="Local DNS server that accepts DNS query requests from local clients, obtains DNS query results from multiple upstream DNS servers, and returns the fastest access results to clients."
arch=("x86_64")
url="https://github.com/pymumu/smartdns"
license=("GPL3")
depends=('openssl')
makedepends=('git') 
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("smartdns::git+https://github.com/pymumu/smartdns.git")
backup=("etc/smartdns/smartdns.conf")
md5sums=('SKIP')
pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/${_pkgname}"
  make clean 
  make VER=$pkgver SBINDIR=/usr/bin RUNSTATEDIR=/run
}
package() {
	cd "$srcdir/${_pkgname}"
  install -Dm755 src/smartdns "$pkgdir/usr/bin/smartdns"
  install -Dm644 etc/smartdns/smartdns.conf "$pkgdir/etc/smartdns/smartdns.conf"
  install -Dm644 etc/default/smartdns "$pkgdir/etc/default/smartdns"
  install -Dm644 systemd/smartdns.service "$pkgdir/usr/lib/systemd/system/smartdns.service"
}
