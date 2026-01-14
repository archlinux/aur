# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=cfspeedtest-bin
pkgver=2.1.0
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
sha256sums=('c274e459bf7567e1c908efaaa34bd584bc16db2370f601810ab711930f9f8bd4')
sha256sums_x86_64=('ca5654c18a84d0f487a336863cdef08b7dc606dad58c4882be07b7cccf8bf0ae')
sha256sums_aarch64=('92369fb0beb3a54c1b2356a29b775714411aacd262b4254e8422cac9740d105e')
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
