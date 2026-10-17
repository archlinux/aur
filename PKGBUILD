# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=17.13.1
pkgrel=1
pkgdesc="Upgrade all the things"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
provides=('topgrade')
conflicts=('topgrade')
source_x86_64=("topgrade_x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("topgrade_aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
source_armv7h=("topgrade_armv7h-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
b2sums_x86_64=('771c6a74f64dbad5fe64221db72f874af7bfc2d62c51008dffcb96a1a6f91b1da95ffc956567177cab2ff9996956f28780db43af8eb1636b261f2bf4d215759b')
b2sums_aarch64=('e40e7a2470ca9d1b57d81edb996790467a968dc870e5e4a1bbc11700f89c1ce0e127cfeabb1893ae9e48ee1cb2ad2ec8658f4d5731d66df05a6ba14a5696e5e5')
b2sums_armv7h=('1fe0c3de945a0398117b5106716f7a01c6d60833df98db134d9d1d96886865c0f26c4ee5bfdd9666631d80b2dbf8943d267f6ee3e3a0aed7897aabce522969ef')
package() {
	# install binary
	install -Dm755 ./topgrade "$pkgdir/usr/bin/topgrade"
	# manpage
	./topgrade --gen-manpage | sed 's/.TH Topgrade 1/.TH Topgrade 8/' >topgrade.8
	install -Dm644 ./topgrade.8 "$pkgdir/usr/share/man/man8/topgrade.8"
	# completions
	# if $(command -v fish &>/dev/null); then
	# 	./topgrade --gen-completion fish >topgrade.fish
	# 	install -Dm644 ./topgrade.fish "${pkgdir}/usr/share/fish/completions/topgrade.fish"
	# fi
	if $(command -v bash &>/dev/null); then
		./topgrade --gen-completion bash >topgrade.bash
		install -Dm644 ./topgrade.bash "${pkgdir}/usr/share/bash-completion/completions/topgrade"
	fi
	if $(command -v zsh &>/dev/null); then
		./topgrade --gen-completion zsh >topgrade.zsh
		install -Dm644 ./topgrade.zsh "${pkgdir}/usr/share/zsh/site-functions/_topgrade"
	fi
	# "Please add 'no_self_update = true' to your 'topgrade.toml' file to disable self updates, as it won't work with this installation"
}
