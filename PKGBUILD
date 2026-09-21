# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=17.12.1
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
b2sums_x86_64=('eb49af4c4901810143c5c165887d3e596b7d527ba5cac54c84a99e28106ecc72cc6d071b257d793acb68c3d75057ce421f635f225d63ff8207f77e626ab84203')
b2sums_aarch64=('09cf6b2cf0cb2236b8894626554fe618ec18668f431240aa966a784ae6a08a38208cc435e760339dfe735d03c25379eefb08b5f7447cc00c96137c355f545754')
b2sums_armv7h=('ff3f1f0c234879bcd6316d96a1f62e1d8195d5bdfd86eafa4ece6631fd551a2f83d4e7b7dba0c4e068b8772ca4245e55fead4e36b22c5c6da8f79797615cdefd')
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
