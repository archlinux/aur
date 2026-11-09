# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=dnscontrol-bin
pkgver=5.8.0
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL (binary release)"
arch=('x86_64')
url="https://dnscontrol.org/"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/StackExchange/dnscontrol/releases/download/v${pkgver}/dnscontrol_${pkgver}_linux_amd64.tar.gz")
sha256sums=('ff3ac6539700d51fc39a3e2199f6cd803f2089172be9c491cacb1f330202a010')

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
