# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-bin
_pkgname=ferium
pkgver=4.3.0
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
sha256sums_x86_64=('8ff3a7a4a76c4b992875a62e9480769bf5845ef01cbe4976decfa4ce1ac852ca')
sha256sums_aarch64=('80a953cd8157c9932192eca42aa23bd17bcbaa3bfe42d0eb2262f0e506b3da86')

package() {
	cd "$srcdir"
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium"
	chmod +x ferium
	./ferium complete bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/ferium
	./ferium complete zsh | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_ferium
	./ferium complete fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/ferium.fish
}
