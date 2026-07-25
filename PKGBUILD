# Maintainer: taxin <unknowbrofrombd@duck.com>
pkgname=bclone
pkgver=1.74.0
pkgrel=1
pkgdesc="rclone with Alist, Alldebrid, iCloud Photos, Teldrive and Terabox support"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/BenjiThatFoxGuy/bclone"
license=(MIT)
depends=(glibc)
optdepends=("fuse3: for rclone mount")
provides=(rclone)
conflicts=(rclone bclone-bin bclone-git)
replaces=(bclone-bin bclone-git rclone)
source=("https://raw.githubusercontent.com/BenjiThatFoxGuy/bclone/refs/tags/v${pkgver}/COPYING")
source_aarch64=("${url}/releases/download/v${pkgver}/rclone-v${pkgver}-linux-arm64.zip")
source_armv7h=("${url}/releases/download/v${pkgver}/rclone-v${pkgver}-linux-arm-v7.zip")
source_x86_64=("${url}/releases/download/v${pkgver}/rclone-v${pkgver}-linux-amd64.zip")
sha256sums=("SKIP")
sha256sums_aarch64=("e8b3b69259f477df62203ac23736951e5030849bf72c48a4842c0f4b76ad662a")
sha256sums_armv7h=("d43fab74c3d02b468c8b2881429e930a5e78d352ab3b1408d365405affca7732")
sha256sums_x86_64=("effb4071349a92309bc240b16bdc7077758fe51a2ba538055ce1e29844a72a90")

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
