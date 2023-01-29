# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=10.2.6
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
b2sums_x86_64=('159247959cc5c024107cf5e2f96c79926d467a2bc21c8c09f6ec62a2732fae6c7e4c686530d9a58388eee107bf71bb9c8107e1e0163db72034e5b21a04dbdbc7')
b2sums_aarch64=('357b0537189365dee73457f0b5cb07c9701b94414a324a476e5386c0e71b05269a592a7c56b7b8e12d6093657f827c0f92cbb260437a466da9ff4046ef024599')
b2sums_armv7h=('80e9ecbb737763a3b329c24a1e99174796237d80c832eb155a5d8c4562a57fd0078d49b91e2264baef05a6f08b73bf367930be6b6b4885cf6584da42459c4bf2')
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
