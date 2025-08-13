# Author: Zeioth
_pkgname=power-rules-daemon
pkgname=power-rules-daemon
url="https://github.com/Zeioth/power-rules-daemon"
pkgver=1.0
pkgrel=3
pkgdesc="Daemon written in Rust to automatically change your power profile while a program is executed."
arch=("any")
license=("GPL-3.0")
depends=("power-profiles-daemon")
makedepends=("git" "rust")
provides=(power-rules-daemon)
conflicts=(power-rules-daemon-git)
options=('!debug') # Disable debug binary
source=("git+$url#commit=9326cd9f0749bcb1f0c96deeb8e0702c35c513a2")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"
	cargo build --release --locked
}

package() {
	cd "${pkgname}"

	# Install the binary
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# Install the service
	install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

	# Install the license
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# Install the manual
	# (for the future)
}
