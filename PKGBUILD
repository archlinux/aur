# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-bin
_pkgname=ferium
pkgver=4.1.5
pkgrel=1
pkgdesc="Fast and multi-source CLI program for managing Minecraft mods and modpacks from Modrinth, CurseForge, and Github Releases"
arch=("x86_64")
depends=("gcc-libs" "bzip2")
provides=("ferium")
conflicts=("ferium-gui-bin" "ferium-git" "ferium-gui-git")
url="https://github.com/gorilla-devs/ferium"
license=('MPL2')
source=("$_pkgname-$pkgver-$pkgrel.zip::https://github.com/gorilla-devs/ferium/releases/download/v$pkgver/ferium-linux-gnu-nogui.zip")
sha256sums=('7ae7278a9b814f0cde84775ea2e79a56a6ee85e5bea98b8d051142db9996ea89')

package() {
	cd "$srcdir"
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium"
	chmod +x ferium
	./ferium complete bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/ferium
	./ferium complete zsh | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_ferium
	./ferium complete fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/ferium.fish
}
