# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=dnscontrol-bin
pkgver=5.3.1
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL (binary release)"
arch=('x86_64')
url="https://dnscontrol.org/"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/StackExchange/dnscontrol/releases/download/v${pkgver}/dnscontrol_${pkgver}_linux_amd64.tar.gz")
sha256sums=('44d545102124e38a045dbaec83823f63cf88a7cded8ce68b5f561cf2026b5dd4')

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
