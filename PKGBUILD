# Maintainer: tom barrett <tom at tombarrett dot xyz>
# https://aur.archlinux.org/packages/port-bin/

pkgname=port
pkgver=1.0.1
pkgrel=1
pkgdesc="A ship runner and manager for Urbit OS"
arch=("x86_64")
url="https://github.com/arthyn/port"
license=("MIT" "custom:chromium")
depends=("urbit" "yarn" "dpkg" "fakeroot" "zip")
conflicts=("port-bin")
source=("git+https://github.com/arthyn/port.git#tag=v${pkgver}")
sha512sums=("SKIP")

package() {
	yarn --cwd "$srcdir"/port
	# the | true is really stupid but until we can just build the exec, i think its required
	yarn --cwd "$srcdir"/port/ run make:linux | true
	mkdir -p "$pkgdir"/usr/bin
	ln -s "$srcdir"/port/out/port-linux-x64/port "$pkgdir"/usr/bin
}
