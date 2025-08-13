# Maintainer: Zeioth
_pkgname=power-rules-daemon
pkgname=power-rules-daemon
pkgver=1.0
pkgrel=1
pkgdesc="Daemon to automatically change your power profile to performance while you are gaming"
arch=("any")
url="https://github.com/Zeioth/power-rules-daemon"
license=("GPL-3.0")
depends=("power-profiles-daemon")
makedepends=("git" "rust")
provides=(power-rules-daemon)
conflicts=(power-rules-daemon-git)
options=('!debug') # Disable debug binary
source=("git+$url#commit=f81d7bcd0194b0f85046224abacd78625724af9e")
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
