# Maintainer: Xarth <xarthleo at gmail dot com>
pkgname=rathole-bin
pkgver=0.5.0
pkgrel=3
pkgdesc="A lightweight and high-performance reverse proxy for NAT traversal"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/rapiz1/rathole"
license=('Apache')
depends=(openssl glibc gcc-libs)
# makedepends=(upx)
backup=('etc/rathole/default.toml')
source=(
	'rathole@.service'
	'rathole.sysusers'
	'rathole.tmpfiles'
	'default.toml'
)
source_x86_64=("https://github.com/rapiz1/rathole/releases/download/v$pkgver/rathole-x86_64-unknown-linux-gnu.zip")
source_aarch64=("https://github.com/rapiz1/rathole/releases/download/v$pkgver/rathole-aarch64-unknown-linux-musl.zip")
source_armv7h=("https://github.com/rapiz1/rathole/releases/download/v$pkgver/rathole-armv7-unknown-linux-musleabihf.zip")
sha256sums=(
	'6dc6cc775311f672d31d4daac5156052e70f3f5697c780edbc6a7cf14cc5faba'
	'f3ff6c1115e59a6108ebd4a450d91fc65cedacc2e6219e3fa3a8a3fa1b9bef1d'
	'd3ec8c7d96d7a6e94f54f3f2d70f78d4bb6a683b1ba98b22b5c67ed1eba1129d'
	'668c6d50e395a466069b72f7f84bf2b7f432aeb3e940b73e937f231385405c67'
)
sha256sums_x86_64=('3e7d0d0f365120cd3cd351d147d1a12ee960c8068b464d4dd533a3821873b80e')
sha256sums_aarch64=('fa4a6fc63d86f8f1faa7c103a845e4715ce79a048455c0eec897b27237576564')
sha256sums_armv7h=('e8662d80d2cc9acc5f8f4d8a1c1a5ff7717b2fa71919a405d0eed8b64c8c1d88')

package() {
	#	use upx -d to allow namcap check the deps
	# upx -d rathole
	install -Dm755 rathole "$pkgdir/usr/bin/rathole"
	install -Dm644 rathole@.service "$pkgdir/usr/lib/systemd/system/rathole@.service"
	install -Dm644 rathole.sysusers "$pkgdir/usr/lib/sysusers.d/rathole.conf"
	install -Dm644 rathole.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/rathole.conf"
	install -Dm640 default.toml "$pkgdir/etc/rathole/default.toml"
}
