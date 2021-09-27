# Maintainer: tom barrett <tom at tombarrett dot xyz>
# https://aur.archlinux.org/packages/port-bin/

pkgname=port
pkgver=1.2.0
pkgrel=1
pkgdesc="A ship runner and manager for Urbit OS"
arch=("x86_64")
url="https://github.com/urbit/port"
license=("MIT" "custom:chromium")
depends=("urbit" "yarn" "zip")
conflicts=("port-bin")
source=("git+https://github.com/urbit/port.git#tag=v${pkgver}")
sha512sums=("SKIP")

package() {
	yarn --cwd "$srcdir"/port
	yarn --cwd "$srcdir"/port/ make --targets=@electron-forge/maker-zip
	install -d -m755 "$pkgdir"/usr/bin
	install -d -m755 "$pkgdir"/usr/share/port
	cp -r "$srcdir"/port/out/port-linux-x64/* "$pkgdir"/usr/share/port
	ln -s /usr/share/port/port "$pkgdir"/usr/bin/port
}
