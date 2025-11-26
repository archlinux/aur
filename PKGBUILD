# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=16.5.0
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
b2sums_x86_64=('245291d439ce274cf1d1142473d40a4cefbe0709c9c7006c3fb262824cfec5cc4454e9a5a90a0a83d7113470065124066a613737a40b9b5ca9d61f2a1eb1b8f8')
b2sums_aarch64=('5a234e38e50f3170f792723b4d197a5e8b7276e11cd8c77dbf09dd30968a348f5dbc148d762ed4721a02d08404fad1eb8c200366413283b93f4803bd6064c291')
b2sums_armv7h=('0d1f0a6ba9d33a572e65f295c70de7dd30c02adfe54b670641176b510de9568371c258a707e793ff566521ccdef7c362b225541eb3181763453e6ffd52ee6110')
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
