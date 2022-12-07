# Maintainer: Sintan Santorum <c1scu0hh at anonaddy dot me>
pkgname="topgrade-bin"
_pkgname="topgrade"
pkgver=10.2.2
pkgrel=1
pkgdesc="Invoke the upgrade procedure of multiple package managers"
arch=('x86_64' 'aarch64' 'armv7')
url='https://github.com/topgrade-rs/topgrade'
license=('GPL3')
provides=('topgrade')
conflicts=('topgrade')
source_x86_64=("topgrade.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("topgrade.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-musl.tar.gz")
source_armv7=("topgrade.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
b2sums_x86_64=('25d3c72e34cdc7a136af15ce94ee7bd3e036ddefee424a1f049141d785e58474c31d892092e50f097c7a3d09d12affac02e9c45ab410e7117a86d7f4f4de4b21')
b2sums_aarch64=('2c9238c6b23cf1f843ca2a9cdcfe21d8080f47c91c11ffebb2e23ebe20ab1ab7a8271f51c43f9b6221d8d79f8db2fdfa988d027fc2d8e1a663ef9431fecb2f2e')
b2sums_armv7=('f672aa4063e0f2e3cf949096b975eb6ecab93e422126bb6280ab7a57ab6ea628e0e5b1df56457824d592adce3015bfff84df5ed040b6385366c55690f1224b63')
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
