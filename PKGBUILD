# Maintainer: quexeky <aur@quexeky.dev>

pkgname=drop-client
pkgver=0.1.0.beta
pkgrel=1
pkgdesc="Arch native client for Drop"
arch=(x86_64)
url="https://wiki.droposs.org/"
license=('AGPL-3.0-only')
depends=('glib2' 'glibc' 'gcc-libs' 'openssl-1.1' 'openssl')
source=("https://github.com/Drop-OSS/drop-app/archive/refs/tags/v0.1.0-beta.tar.gz")
makedepends=('yarn' 'cargo' 'openssl-1.1' 'openssl')
sha256sums=('cb42c23925b13eccdc231fb2a82ef7bd5be91ca5e75ec325f0908ee9eb8b6569')


prepare() {
	export RUSTUP_TOOLCHAIN=stable
	cd drop-app-0.1.0-beta/
	yarn
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	CFLAGS+=' -ffat-lto-objects'
	cd drop-app-0.1.0-beta
	yarn tauri build
}

package() {
	cd drop-app-0.1.0-beta
	install -Dm0755 -t "$pkgdir/usr/bin" "src-tauri/target/release/drop-app"
}
