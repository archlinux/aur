# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-bin
_pkgname=ferium
pkgver=4.3.2
pkgrel=1
pkgdesc="Fast and multi-source CLI program for managing Minecraft mods and modpacks from Modrinth, CurseForge, and Github Releases"
arch=("x86_64" "aarch64")
depends=("bzip2")
provides=("ferium")
conflicts=("ferium-gui-bin" "ferium-git" "ferium-gui-git")
url="https://github.com/gorilla-devs/ferium"
license=('MPL2')
source_x86_64=("$_pkgname-$pkgver-$pkgrel.x86_64.zip::https://github.com/gorilla-devs/ferium/releases/download/v$pkgver/ferium-linux-nogui.zip")
source_aarch64=("$_pkgname-$pkgver-$pkgrel.aarch64.zip::https://github.com/gorilla-devs/ferium/releases/download/v$pkgver/ferium-linux-arm64-nogui.zip")
sha256sums_x86_64=('4aa1b5ad928cb7531361c58795f8a36b3a6bba75bd15eac1ae1201792cbc03e0')
sha256sums_aarch64=('47debafd4900794dcb267b078ba3b75632f731b4aade59948a91386304965ea4')

package() {
	cd "$srcdir"
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium"
	chmod +x ferium
	./ferium complete bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/ferium
	./ferium complete zsh | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_ferium
	./ferium complete fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/ferium.fish
}
