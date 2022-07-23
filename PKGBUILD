# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=gnome-shell-extension-quick-settings-git
pkgver=r152.b3e0d0d
pkgrel=1
pkgdesc='Quick Settings for Gnome'
arch=(any)
url=https://gitlab.gnome.org/fmuellner/quick-settings-extension
license=(unknown)
depends=(gnome-shell)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url")
md5sums=(SKIP)

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	gnome-extensions pack \
		--extra-source=dark-mode-symbolic.svg \
		--extra-source=quickSettings.js \
		--extra-source=status/ \
		--force
}

package() {
	cd "${pkgname%-git}"
	_extensiondir="/usr/share/gnome-shell/extensions/quick-settings@fmuellner.gnome.org"
	install -d "$pkgdir$_extensiondir"
	bsdtar -xf quick-settings@fmuellner.gnome.org.shell-extension.zip -C "$pkgdir$_extensiondir"
}
