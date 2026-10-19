# Maintainer: taxin-404 <taxin404@duck.com>
pkgname=bclone-bin
pkgver=1.75.3
pkgrel=1
pkgdesc="rclone with Alist, Alldebrid, iCloud Photos, Teldrive, Terabox, Tmpfs and unofficial Google Photos support"
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
sha256sums=('8cd2e9e750b90a04b7d82dbbca3930c696ae0309d7c10464f90a44f45754cd04')
sha256sums_x86_64=('cd078b4383ad0004c3d50c50f1da7e7cd45685c3b61ce68ba6c136b830ac9104')
sha256sums_aarch64=('1631e54879205eddaf6280dd4202ef0b467267325b28ee74512f5f3c0afdf50b')
sha256sums_armv7h=('482543c1e56d5218391451902ac1f0659124bec746d9c7912976ae046a5607ed')

prepare() {
	cd "$(find . -type d -regex ".*/rclone-v${pkgver}-linux-\(amd64\|arm64\|arm-v7\)")"

	./rclone genautocomplete bash rclone.bash_completion
	./rclone genautocomplete zsh rclone.zsh_completion
	./rclone genautocomplete fish rclone.fish_completion
}

package() {
	cd "$(find . -type d -regex ".*/rclone-v${pkgver}-linux-\(amd64\|arm64\|arm-v7\)")"

	install -D rclone "$pkgdir"/usr/bin/rclone
	install -Dm644 rclone.bash_completion "$pkgdir"/usr/share/bash-completion/completions/rclone
	install -Dm644 rclone.zsh_completion "$pkgdir"/usr/share/zsh/site-functions/_rclone
	install -Dm644 rclone.fish_completion "$pkgdir"/usr/share/fish/vendor_completions.d/rclone.fish
	install -Dm644 ../COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
	install -Dm644 rclone.1 "$pkgdir"/usr/share/man/man1/rclone.1
	install -d "$pkgdir"/usr/share/doc/$pkgname
	install -t "$pkgdir"/usr/share/doc/$pkgname -m644 README.html README.txt
}
