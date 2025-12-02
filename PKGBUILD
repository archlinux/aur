# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=cfspeedtest-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Unofficial CLI for speed.cloudflare.com"
arch=('x86_64' 'aarch64')
url="https://github.com/code-inflation/cfspeedtest/"
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("$url/releases/download/v${pkgver}/${pkgname::-4}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname::-4}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('d4be9ee03851d4383544911a0d2e88d7835113fc3091a65ccf3f98ba5439da61')
sha256sums_x86_64=('9e5def0c5628b80f479f1de189ce74cac1f94dd46634799ee4af3ace702a2f55')
sha256sums_aarch64=('d53b36ea3bc1feb692e3874c7414ca25bb16e05436426bad3b476876cfee5ed3')
validpgpkeys=()

package() {
	install -Dm755 "$srcdir/${pkgname::-4}" "$pkgdir/usr/bin/${pkgname::-4}"
	install -Dm644 "$srcdir/${pkgname::-4}-${pkgver}/LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"

	install -dm755 "$pkgdir/usr/share/bash-completion/completions" && \
		"$srcdir/${pkgname::-4}" --generate-completion bash > \
		"$pkgdir/usr/share/bash-completion/completions/cfspeedtest"
	install -dm755 "$pkgdir/usr/share/zsh/site-functions" && \
		"$srcdir/${pkgname::-4}" --generate-completion zsh > \
		"$pkgdir/usr/share/zsh/site-functions/_cfspeedtest"
	install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d" && \
		"$srcdir/${pkgname::-4}" --generate-completion fish > \
		"$pkgdir/usr/share/fish/vendor_completions.d/cfspeedtest.fish"
}
