# Maintainer: avscs <avscs@proton.me>
pkgname=bclone-bin
pkgver=1.73.3
pkgrel=1
pkgdesc="rclone with Alist, Alldebrid, iCloud Photos, Teldrive and Terabox support"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/BenjiThatFoxGuy/bclone"
license=(MIT)
depends=(glibc)
optdepends=("fuse3: for rclone mount")
provides=(rclone bclone)
conflicts=(rclone bclone)
source=("https://raw.githubusercontent.com/BenjiThatFoxGuy/bclone/refs/tags/v${pkgver}/COPYING")
source_aarch64=("${url}/releases/download/v${pkgver}/rclone-v${pkgver}-linux-arm64.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/rclone-v${pkgver}-linux-arm-v7.zip")
source_x86_64=("${url}/releases/download/v${pkgver}/rclone-v${pkgver}-linux-amd64.zip")
sha256sums=("SKIP")
sha256sums_aarch64=("ec74c86c78edb5f84d230e20d44ec353270b5ba2644ec97fe4c39b4fe1c97b9b")
sha256sums_armv7h=("06b62f6fc68a00f146fafa2648e28770faa8e0dcc6ce554aa604c19b7ab4a385")
sha256sums_x86_64=("0d23270f03e546c5e9f4e71304b1202f8a3e989490f619b2a7c514ea817c7cd2")

prepare() {
	cd $(find . -type d -regex ".*/rclone-v${pkgver}-linux-\(amd64\|arm64\|arm-v7\)")

	./rclone genautocomplete bash rclone.bash_completion
	./rclone genautocomplete zsh rclone.zsh_completion
	./rclone genautocomplete fish rclone.fish_completion
}

package() {
	cd $(find . -type d -regex ".*/rclone-v${pkgver}-linux-\(amd64\|arm64\|arm-v7\)")

	install -D rclone ${pkgdir}/usr/bin/rclone
	install -Dm644 rclone.bash_completion "$pkgdir"/usr/share/bash-completion/completions/rclone
	install -Dm644 rclone.zsh_completion "$pkgdir"/usr/share/zsh/site-functions/_rclone
	install -Dm644 rclone.fish_completion "$pkgdir"/usr/share/fish/vendor_completions.d/rclone.fish
	install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
	install -Dm644 rclone.1 "$pkgdir"/usr/share/man/man1/rclone.1
	install -d "$pkgdir"/usr/share/doc/$pkgname
	install -t "$pkgdir"/usr/share/doc/$pkgname -m644 README.html README.txt
}
