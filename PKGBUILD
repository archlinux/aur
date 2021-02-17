# Maintainer: Slenderchat <slenderchat@sl-chat.ru>
pkgname='https-dns-proxy-git'
pkgver=r192.3402e45
pkgrel=2
arch=('x86_64')
url='https://github.com/aarond10/https_dns_proxy'
license=('MIT')
makedepends=('cmake' 'c-ares' 'libev')
depends=('keyutils' 'krb5' 'libunistring' 'zlib' 'zstd' 'e2fsprogs' 'openssl' 'libpsl' 'libssh2' 'libidn2' 'libnghttp2' 'curl' 'c-ares' 'libev')
source=('git://github.com/aarond10/https_dns_proxy.git' https_dns_proxy.service)
sha512sums=('SKIP' '45f3806bd2c80d4c3f0200d63d1f748ea175a58450da1c04ded66b5d6ed723ea53bd661a083890700242163a46d20bf6f9ddb35081d5b45297a710659521a1e3')
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
