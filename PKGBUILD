# Maintainer: Gleb Sinyavskiy <zhulik.gleb@gmail.com>
pkgname=neolink-git
_pkgname=neolink
pkgver=0.3.0.cf54129
pkgrel=1
pkgdesc="An RTSP bridge to Reolink IP cameras."
arch=('x86_64')
url="https://github.com/thirtythreeforty/$_pkgname"
license=('AGPL3')
depends=('gst-rtsp-server')
makedepends=('git' 'rust')
source=("git+https://github.com/thirtythreeforty/$_pkgname.git"
				"$_pkgname.toml"
				"$_pkgname.sysusers"
				"$_pkgname.service")
sha256sums=("SKIP"
						"3286177dcb2bcbe5b56c8f59f8d15b6cf0ee70632a261109e72fe6797f153507"
						"27d0ecc90731e703228efd1c922421cab01c6495943b6f07a97a8c20518c8a17"
						"2316a242dede941daf121261652a67ae69bc1922415b6c2238f558cd584dda4a")

backup=("etc/$_pkgname.toml")

build() {
	cd "$_pkgname"
	cargo build --release --workspace
}

package() {
	install -Dm755 "$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_pkgname.toml" "$pkgdir/etc/$_pkgname.toml"
	install -Dm 644 "$_pkgname.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm 644 "$_pkgname.service" -t "${pkgdir}/usr/lib/systemd/system"
}
