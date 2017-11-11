# Maintainer : chliny <chliny11 at gmail dot com>

pkgname=shadowsocks-rust
pkgver=v1.6.8.3.gf6e57b7
pkgrel=1
pkgdesc='A Rust port of shadowsocks https://shadowsocks.org/'
arch=('any')
url='https://github.com/shadowsocks/shadowsocks-rust'
license=('MIT')
depends=('openssl' 'libsodium')
makedepends=('cargo')
source=(
    "git+https://github.com/shadowsocks/${pkgname}.git"
	'shadowsocks-rust@.service'
	'shadowsocks-rust-server@.service')

sha512sums=(
    'SKIP'
	'914195b9da8db811980b44caf9d2efa5170eb6a582e81aef2b251decf82caf6650ebe23cc371517ff9cfb01631c24382497246531774028adccfa4481595f694'
	'6e7bbe4140f16cb6216cc57ee676609c8f174548768cb5298aa6f23a9bbdbd30877967a338132d94a188e11c44b34a7d64c259cd33971907a3718f0bc7ca87a4'
)

pkgver() {
 	cd "${srcdir}/${pkgname}"
    git describe --tags | sed -E 's/^ver\.//;s/-/./g'
}

build() {
 	cd "${srcdir}/${pkgname}"
	cargo build --release
}

package() {
 	cd "${srcdir}/${pkgname}"

	install -Dm755 "target/release/sslocal" "${pkgdir}/usr/bin/sslocal-rust"
	install -Dm755 "target/release/ssserver" "${pkgdir}/usr/bin/ssserver-rust"
	install -Dm755 "target/release/ssurl" "${pkgdir}/usr/bin/ssurl-rust"
	install -Dm644 "${srcdir}/shadowsocks-rust@.service" "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust@.service"
	install -Dm644 "${srcdir}/shadowsocks-rust-server@.service" "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust-server@.service"
	install -Dm644 "examples/config_ext.json" "${pkgdir}/etc/shadowsocks/config_ext_rust.json.example"
	install -Dm644 "examples/config.json" "${pkgdir}/etc/shadowsocks/config_rust.json.example"
}




