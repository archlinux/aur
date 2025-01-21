# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=dnscontrol-bin
pkgver=4.15.6
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL (binary release)"
arch=('x86_64')
url="https://stackexchange.github.io/dnscontrol/"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/StackExchange/dnscontrol/releases/download/v${pkgver}/dnscontrol_${pkgver}_linux_amd64.tar.gz")
sha256sums=('4d4352c17642578e7e30a5d17fb843b4776fb109729666d6be6c7bc87795187d')

build() {
	./dnscontrol shell-completion zsh > completions.zsh
	./dnscontrol shell-completion bash > completions.bash
}

package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 completions.zsh "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-bin}"
	install -Dm644 completions.bash "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}"
}
