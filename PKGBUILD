# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-gui-bin
_pkgname=ferium-gui
pkgver=4.3.3
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

sha256sums_x86_64=('2f10a6eac0b859253c4e7ba1a3c1ea37ccab0993fc8a591d85a90d99c5a9b9e2')
sha256sums_aarch64=('09409be04abab1652aa3142461391b018ddd588f0776fdfd508c05b655a1fb8a')

package() {
	cd "$srcdir"
	install -Dm0755 "ferium" "$pkgdir/usr/bin/ferium" 
	chmod +x ferium
	./ferium complete bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/ferium
	./ferium complete zsh | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_ferium
	./ferium complete fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/ferium.fish
}
