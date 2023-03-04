# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>

pkgname=shadowsocks-rust-multiprofile-daemon-git
_pkgname=shadowsocks-rust-multiprofile-daemon
pkgver=r2.ec5efb7
pkgrel=1
pkgdesc='Systemd units that make it easy to work with multiple shadowsocks-rust profiles.'
arch=("any")
url="https://github.com/spyophobia/shadowsocks-rust-multiprofile-daemon"
license=("MIT")
depends=("git")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"

    install -Dm644 shadowsocks-rust-local@.service.system "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust-local@.service"
    install -Dm644 shadowsocks-rust-server@.service.system "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust-server@.service"
    install -Dm644 shadowsocks-rust-local@.service.user "${pkgdir}/usr/lib/systemd/user/shadowsocks-rust-local@.service"
    install -Dm644 shadowsocks-rust-server@.service.user "${pkgdir}/usr/lib/systemd/user/shadowsocks-rust-server@.service"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
