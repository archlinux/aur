# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-gui-bin
_pkgname=ferium-gui
pkgver=4.3.0
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

sha256sums_x86_64=('cf75bcbb684676ece4e7fbb3bac24c12becdd7aff4a08807dda8b6cd8570f895')
sha256sums_aarch64=('d34b608672cae4bc6cec06478c2ff91c48c81c2a995b2913c96a903aa054a838')

package() {
	cd "$srcdir"
	install -Dm0755 "ferium" "$pkgdir/usr/bin/ferium" 
	chmod +x ferium
	./ferium complete bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/ferium
	./ferium complete zsh | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_ferium
	./ferium complete fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/ferium.fish
}
