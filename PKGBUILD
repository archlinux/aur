# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=cfspeedtest-bin
pkgver=2.0.0
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
sha256sums=('cd93abf6c3afb0a1a2617485795f99093ad19928f39a93f1f858023aed9abf06')
sha256sums_x86_64=('44c677ca6dc1e2e129700e85bea808fe68ed2ae56be90665410aa902ea98f3e9')
sha256sums_aarch64=('daf596a78d77ddcf759cf9672e8f6e4e0b056055f79a849ecdf753b9117b1767')
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
