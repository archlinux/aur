# Maintainer : rustemb <rustemb@systemli.org>

pkgname=shadowsocks-rust
pkgver=1.8.23
pkgrel=1
pkgdesc='A Rust port of shadowsocks https://shadowsocks.org/'
arch=('any')
url='https://github.com/shadowsocks/shadowsocks-rust'
license=('MIT')
depends=('openssl')
makedepends=('cargo' 'libsodium')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'shadowsocks-rust@.service'
        'shadowsocks-rust-server@.service')

md5sums=('4490d81e006f66fc263dcbbad64b724d'
         '86165927273bb5efbfda1eb6fdf09315'
         '9fc8b2c0cadb01ab6b38a95766877a20')

build() {
 	cd "${pkgname}-${pkgver}"
	cargo build --release
}

package() {
 	cd "${pkgname}-${pkgver}"
	install -Dm755 "target/release/sslocal" "${pkgdir}/usr/bin/sslocal-rust"
	install -Dm755 "target/release/ssserver" "${pkgdir}/usr/bin/ssserver-rust"
	install -Dm755 "target/release/ssurl" "${pkgdir}/usr/bin/ssurl-rust"
	install -Dm644 "${srcdir}/shadowsocks-rust@.service" "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust@.service"
	install -Dm644 "${srcdir}/shadowsocks-rust-server@.service" "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust-server@.service"
	install -Dm644 "examples/config_ext.json" "${pkgdir}/etc/shadowsocks/config_ext_rust.json.example"
	install -Dm644 "examples/config.json" "${pkgdir}/etc/shadowsocks/config_rust.json.example"
}

