# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-gui-bin
_pkgname=ferium-gui
pkgver=4.3.4
pkgrel=1
pkgdesc="Fast and multi-source CLI program for managing Minecraft mods and modpacks from Modrinth, CurseForge, and Github Releases"
arch=("x86_64" "aarch64")
depends=("xdg-desktop-portal" "bzip2")
provides=("ferium")
conflicts=("ferium-bin" "ferium-gui-git" "ferium-git")
url="https://github.com/theRookieCoder/ferium"
license=('MPL2')

source_x86_64=("$_pkgname-$pkgver-$pkgrel.x86_64.zip::${url}/releases/download/v${pkgver}/ferium-linux.zip")
source_aarch64=("$_pkgname-$pkgver-$pkgrel.aarch64.zip::${url}/releases/download/v${pkgver}/ferium-linux-arm64.zip")

sha256sums_x86_64=('8f33abee023afc22a97610f3a5571715080f18034603b1a47c8dc8841289d968')
sha256sums_aarch64=('4f5f56f5f1b9d2de5c9a63803dba69e9ba9c0acd705b33d18dca38525d5c9326')

package() {
	cd "$srcdir"
	install -Dm0755 "ferium" "$pkgdir/usr/bin/ferium" 
	chmod +x ferium
	./ferium complete bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/ferium
	./ferium complete zsh | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_ferium
	./ferium complete fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/ferium.fish
}
