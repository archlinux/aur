# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-bin
_pkgname=ferium
pkgver=4.2.1
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
sha256sums_x86_64=('bfb75773fed73b88b52deb0765c57cc8e157397bd72668b61ed4fa8e988466fa')
sha256sums_aarch64=('5b5705100038a5576844950b2463e0073376b062ea5eb175dcf99436397ed382')

package() {
	cd "$srcdir"
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium"
	chmod +x ferium
	./ferium complete bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/ferium
	./ferium complete zsh | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_ferium
	./ferium complete fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/ferium.fish
}
