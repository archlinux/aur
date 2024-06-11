# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-bin
_pkgname=ferium
pkgver=4.7.0
pkgrel=1
pkgdesc="Fast and multi-source CLI program for managing Minecraft mods and modpacks from Modrinth, CurseForge, and Github Releases"
arch=("x86_64" "aarch64")
provides=("ferium")
conflicts=("ferium-gui-bin" "ferium-git" "ferium-gui-git")
url="https://github.com/gorilla-devs/ferium"
license=('MPL2')
source_x86_64=("$_pkgname-$pkgver-$pkgrel.x86_64.zip::https://github.com/gorilla-devs/ferium/releases/download/v$pkgver/ferium-linux-nogui.zip")
source_aarch64=("$_pkgname-$pkgver-$pkgrel.aarch64.zip::https://github.com/gorilla-devs/ferium/releases/download/v$pkgver/ferium-linux-arm64-nogui.zip")
sha256sums_x86_64=('d38db96b4352493d1b2c58413cea3765a654177e79856c7f086dc60d21e97ac6')
sha256sums_aarch64=('05e3945a63e1d23b38160cf9c7e2758ef78a7fd06740a14e8e92a5ec20b38981')

package() {
	cd "$srcdir"
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium"
	chmod +x ferium
	./ferium complete bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/ferium
	./ferium complete zsh | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_ferium
	./ferium complete fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/ferium.fish
}
