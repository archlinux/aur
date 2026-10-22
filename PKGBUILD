# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

# shellcheck disable=SC2154

pkgname=keepalive-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Keep-Alive is a lightweight, cross-platform utility to prevent your system from sleeping. Perfect for uninterrupted downloads, active connections, or long-running tasks, like vibe coding."
arch=('x86_64')
url="https://github.com/stigoleg/keep-alive"
license=('MIT')

optdepends=('ydotool: simulate activity on Wayland or X11'
	'xdotool: simulate activity on X11')
install=keepalive.install

source=("keepalive_${pkgver}_linux_amd64.deb::https://github.com/stigoleg/keep-alive/releases/download/v${pkgver}/keepalive_${pkgver}_linux_amd64.deb"
	keepalive.service)
noextract=("keepalive_${pkgver}_linux_amd64.deb")
b2sums=('fb6feba5c6f24d4aa33849be0d96a9275679e15c4a793e109feb3125a68b52ab45fc515b5d183e08acbcc76b9197c9ce532790731f0fec60dbfc8795b39a56b3'
	'ed127e4719c403a9d7d99e2141694829f4e1675b5c59d15953ebf2e1bd49d980ff47bcc68df7ecfdb8311e47a0d4a10cbc66bdb9f7d17896a63e38e6330315e3')

package() {
	set -o pipefail
	ar p "${srcdir}/keepalive_${pkgver}_linux_amd64.deb" data.tar.gz | tar -xz -C "${pkgdir}"

	install -Dm644 "${pkgdir}/usr/share/doc/keepalive/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	rm "${pkgdir}/usr/share/doc/keepalive/copyright"
	rmdir "${pkgdir}/usr/share/doc/keepalive" "${pkgdir}/usr/share/doc"

	install -Dm644 "${pkgdir}/usr/share/zsh/vendor-completions/_keepalive" "${pkgdir}/usr/share/zsh/site-functions/_keepalive"
	rm "${pkgdir}/usr/share/zsh/vendor-completions/_keepalive"
	rmdir "${pkgdir}/usr/share/zsh/vendor-completions"

	install -Dm644 "${srcdir}/keepalive.service" "${pkgdir}/usr/lib/systemd/user/keepalive.service"
}
