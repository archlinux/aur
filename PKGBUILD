# Maintainer: threadexio <pzarganitis at gmail dot com>
pkgname=zeus-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="The containerized AUR helper"
url="https://github.com/threadexio/zeus"
arch=('x86_64')
license=('GPL')
depends=('docker')
source=("zeus-bin-${pkgver}.tar.gz::https://github.com/threadexio/zeus/releases/download/v${pkgver}/zeus-bin.tar.gz")
sha256sums=('8ad3e2eda112019d3abcd6daebe7a0d1bf4d4991388fc016256b3bcf7de12281')
conflicts=(zeus podman-docker)

package() {
	cd "$srcdir"

	install -Dm755 -t "$pkgdir/usr/bin" zeus
	install -Dm644 -t "$pkgdir/usr/share/zeus" builder.tar.gz

	mkdir -p "$pkgdir/var/cache/aur"
	chmod 0777 "$pkgdir/var/cache/aur"
	
	install -Dm644 -t "$pkgdir/etc/apparmor.d" apparmor/zeus

	install -Dm644 completions/zeus.bash "$pkgdir/usr/share/bash-completion/completions/zeus"
	install -Dm644 completions/zeus.zsh "$pkgdir/usr/share/zsh/site-functions/_zeus"
	install -Dm644 completions/zeus.fish "$pkgdir/usr/share/fish/vendor_completions.d/zeus.fish"
}
