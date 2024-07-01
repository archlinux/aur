# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=15.0.0
pkgrel=1
pkgdesc="Invoke the upgrade procedure of multiple package managers"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
provides=('topgrade')
conflicts=('topgrade')
source_x86_64=("topgrade_x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("topgrade_aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
source_armv7h=("topgrade_armv7h-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
b2sums_x86_64=('9d234069edccf6f4ff786aabe92a8aa8575378a94b34ddbc882c5b499dddcc3510d3739ff9c219e5d3e995c04ffdee05755deea6e93309e77174ac90a8439fda')
b2sums_aarch64=('c5e810d6c7670e7c07b5d2514445e5471cad1a1c498cea9c0fe48481b23e54a809f6ddb2cae2361a1c53260a13cc2f7c1cb6b043553621ddcbed23de6559f7b6')
b2sums_armv7h=('a42d3e5ae7923865a4a288f60cfdd3c8f9730f76e1da07d96b0887ae34c3d0be9ba97d7d124a0bd1fe14b72bf85e8f084dcae5d4e531bab133ba63bbbf466002')
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
