# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=17.12.3
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
b2sums_x86_64=('b1e9610c7c0f59a753888c204ffc1980ad7766f5a7c0f98d7c93e87d4ef0d3078fee5df3900a9cafdbdd1c8297b9e77523b353264b7d43583cf1c7360be3f02c')
b2sums_aarch64=('517ae1700dfa5794d1ae795f35a775f315525cfdbba237d6cc7936af64ff779588ffe23350014cd8f50ba41c7c1557aaf7216e2d2cbc83728da9db6d14e0f6a0')
b2sums_armv7h=('acdfb0a528542d9dd7dbf7868b0b81ed1e23ce4ebcacd513e1eaa288279324493cdaf6fd8800cc70ce09696a5aefaa4ea8eb38e451f5103a29ae53c55c3d065f')
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
