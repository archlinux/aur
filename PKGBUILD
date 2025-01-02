# Maintainer: Boris-Chengbiao Zhou <bobo1239@web.de>

pkgname=ctf-ynetd
pkgver=2024.12.31
pkgrel=1
pkgdesc='A fork of ynetd hardened for CTFs. Supports isolation using PID namespaces, minimal overhead proof-of-work checking, and strict resource limits via cgroups.'
url='https://hxp.io/code/'
license=('MIT')
depends=('glibc' 'gcc-libs' 'openssl')
provides=('ynetd')
conflicts=('ynetd')
source=("https://hxp.io/assets/data/code/ctf-ynetd-${pkgver}.tar.xz")
sha512sums=("03e761752c0cf5a3b4e4287b78590307d58ca11f1ba1d8343eca0a363862372685c85c726f9c8e771aea587f3fb4083aeaf18e81b0bbf14e33601c2968d0a980")
arch=('i686' 'x86_64')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Prefer the original compilation flags since they're hardened for CTF use
	unset CFLAGS
	make
	make pow-solver
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "ynetd" "${pkgdir}/usr/bin/ynetd"
	install -Dm755 "pow-solver" "${pkgdir}/usr/bin/pow-solver"
	install -Dm644 'LICENSE.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
