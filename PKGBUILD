# Maintainer: Dale Whinham <daleyo at gmail dot com>
pkgname=mt32-pi-control
pkgver=1.0.1a
pkgrel=1
pkgdesc="A control program for the mt32-pi MIDI synthesizer"
arch=("i686" "x86_64" "armv7h" "aarch64")
url="https://github.com/gmcn42/mt32-pi-control"
license=("BSD")
depends=("alsa-lib")
optdepends=("bash-completion: for Bash shell auto-completion"
	    "alsa-utils: for auto-completion of the -p option")
source=("https://github.com/gmcn42/mt32-pi-control/archive/v$pkgver.tar.gz")
sha256sums=("564cfc4f259513a1b44d37d7e785f6202386834b54204816fa4a4e0d7871b229")

build() {
	cd "$srcdir"/"$pkgname"-"$pkgver"
	mkdir -p linux_bin
	make -C linux_src -j dist
}

package() {
	cd "$srcdir"/"$pkgname"-"$pkgver"
	install -Dm755 linux_bin/mt32-pi-ctl "$pkgdir"/usr/bin/mt32-pi-ctl
	install -Dm644 linux_src/completion_scripts/mt32-pi-ctl.bash "$pkgdir"/usr/share/bash-completion/completions/mt32-pi-ctl
	install -Dm644 linux_src/completion_scripts/mt32-pi-ctl.fish "$pkgdir"/usr/share/fish/vendor_completions.d/mt32-pi-ctl.fish
	install -Dm644 linux_src/completion_scripts/mt32-pi-ctl.zsh "$pkgdir"/usr/share/zsh/site-functions/_mt32-pi-ctl
	install -Dm644 linux_bin/mt32pi.bmp "$pkgdir"/usr/share/"$pkgname"/mt32pi.bmp
	install -m644 README.md "$pkgdir"/usr/share/"$pkgname"/README.md

	# License is BSD 2-clause and needs to be installed
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
