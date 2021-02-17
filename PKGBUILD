# Maintainer: Slenderchat <slenderchat@sl-chat.ru>
pkgname='https-dns-proxy-git'
pkgver=r192.3402e45
pkgrel=3
arch=('x86_64')
url='https://github.com/aarond10/https_dns_proxy'
license=('MIT')
makedepends=('cmake' 'c-ares' 'libev')
depends=('keyutils' 'krb5' 'libunistring' 'zlib' 'zstd' 'e2fsprogs' 'openssl' 'libpsl' 'libssh2' 'libidn2' 'libnghttp2' 'curl' 'c-ares' 'libev')
source=('git://github.com/aarond10/https_dns_proxy.git' https_dns_proxy.service)
sha512sums=('SKIP' '707b5451848d0a8f1859d769271e8822d2408f23a5ddc5ede415995911547171260123d3356d87b2fd0500861ae57287362a8df2c150be61e0352ea2c10ebf49')
pkgver() {
	cd "${srcdir}/https_dns_proxy"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
