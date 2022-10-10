# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-gui-bin
_pkgname=ferium-gui
pkgver=4.2.0
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

sha256sums_x86_64=('57eb7d09d62d841d55a71a4831238b69c5b256f42c4f59994458f048491b6c25')
sha256sums_aarch64=('5c9b4214206b9383e72ac2d1a4c05425bd960b6c38b32eb53a492a81b9a0cb94')

package() {
	cd "$srcdir"
	install -Dm0755 "ferium" "$pkgdir/usr/bin/ferium" 
	chmod +x ferium
	./ferium complete bash | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/bash-completion/completions/ferium
	./ferium complete zsh | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/zsh/site-functions/_ferium
	./ferium complete fish | install -Dm644 /dev/stdin "${pkgdir}"/usr/share/fish/vendor_completions.d/ferium.fish
}
