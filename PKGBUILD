# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-gui-bin
_pkgname=ferium-gui
pkgver=4.3.1
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

sha256sums_x86_64=('39fa155bb642c10b462382ec4b79148914209ea0fbbd83ab13e1986c78286f86')
sha256sums_aarch64=('ae15788eadff0ec1c6ca03f57036e82bd34b9321b96da6f4b7a8b42144d93ca8')

package() {
	cd "$srcdir"
	install -Dm0755 "ferium" "$pkgdir/usr/bin/ferium" 
	chmod +x ferium
	./ferium complete bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/ferium
	./ferium complete zsh | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_ferium
	./ferium complete fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/ferium.fish
}
