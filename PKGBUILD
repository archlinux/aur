# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=10.3.0
pkgrel=1
pkgdesc="Invoke the upgrade procedure of multiple package managers"
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
provides=('topgrade')
conflicts=('topgrade')
source_x86_64=("topgrade.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("topgrade.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
source_armv7h=("topgrade.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
b2sums_x86_64=('6af320f6d27cc8b4267c1e1e80e4e4f0902f575c12b8acfaeaf60ae794512a607de17adedf033ff68bf4f611475d753d5b3a9442ab2d6dc4b4ff178da612328a')
b2sums_aarch64=('e90b07428242f269b305d83e9cdc86c4fe27e289095747b1b9531ab4ed00990ae203e4e4fcbba30ac726230084e4ed0f5674cf514ce77302ad537d4267f18927')
b2sums_armv7h=('627b59c3fd0a8ace3185c390845d484f106927a2f37d1fc0baa5cab28e0b8b3d162d8ae8ede899af486486e716dd8a35d9bc3040b2affa65f98910bb358d795e')
package() {
	# binary
	install -Dm755 ./topgrade "$pkgdir/usr/local/bin/topgrade"
	# manpage
	./topgrade --gen-manpage | sed 's/.TH Topgrade 1/.TH Topgrade 8/' > topgrade.8
	install -Dm644 ./topgrade.8 "$pkgdir/usr/local/man/man8/topgrade.8"
	# completions
	if $(command -v fish &> /dev/null); then
		./topgrade --gen-completion fish > topgrade.fish
		install -Dm644 ./topgrade.fish "${pkgdir}/usr/share/fish/completions/topgrade.fish"
	fi
	if $(command -v bash &> /dev/null); then
		./topgrade --gen-completion bash > topgrade.bash
		install -Dm644 ./topgrade.bash  "${pkgdir}/usr/share/bash-completion/completions/topgrade"
	fi
	if $(command -v zsh &> /dev/null); then
		./topgrade --gen-completion zsh > topgrade.zsh
		install -Dm644 ./topgrade.zsh "${pkgdir}/usr/share/zsh/site-functions/_topgrade"
	fi
}
