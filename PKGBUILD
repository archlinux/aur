# Maintainer: Zeioth
_pkgname=power-rules-daemon
pkgname=power-rules-daemon-git
pkgver=1.0
pkgrel=2
pkgdesc="Daemon written in Rust to automatically change your power profile when a program is executed."
arch=("any")
url="https://github.com/Zeioth/power-rules-daemon"
license=("GPL-3.0")
depends=("power-profiles-daemon")
makedepends=("git" "rust")
provides=(power-rules-daemon-git)
conflicts=(power-rules-daemon)
options=('!debug') # Disable debug binary
source=("git+$url#commit=f81d7bcd0194b0f85046224abacd78625724af9e")
sha256sums=('SKIP')

build() {
	cd "${_pkgname}"
	cargo build --release --locked
}

package() {
	cd "${_pkgname}"

	# Install the binary
	install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	# Install the service
	install -Dm644 "$_pkgname.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

	# Install the license
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	# Install the manual
	# (for the future)
}
