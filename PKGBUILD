# Maintainer: jynn <uaggz@student.kit.edu>
pkgname=dnsblock-git
pkgver=r350.f4141e8
pkgrel=1
pkgdesc="get a list of servers to block ads using your dns"
arch=('any')
url="https://github.com/jyn-n/dnsblock"
license=('GPL')
provides=('dnsblock')
conflicts=('dnsblock')
source=(git+https://github.com/jyn-n/dnsblock.git)
md5sums=('SKIP')

prepare() {
	cd "${srcdir}/dnsblock/files"
}

check() {
	cd "${srcdir}/dnsblock/files"
	make -k check
}

pkgver() {
	cd "${srcdir}/dnsblock"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/dnsblock/files"
	mkdir -p $pkgdir/etc/dnsblock
	install -m 0644 blocklist $pkgdir/etc/dnsblock
	install -m 0644 dnsmasq $pkgdir/etc/dnsblock
}

