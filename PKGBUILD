# Maintainer: Lefthook <lefthook@evilmartians.com>

pkgname=lefthook-bin
pkgdesc="Git hooks manager"
pkgver=2.1.7
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
depends=()
makedepends=()
provides=('lefthook')
conflicts=('lefthook')
source_x86_64=("https://github.com/evilmartians/lefthook/releases/download/v${pkgver}/lefthook_${pkgver}_Linux_x86_64.gz")
source_aarch64=("https://github.com/evilmartians/lefthook/releases/download/v${pkgver}/lefthook_${pkgver}_Linux_aarch64.gz")
sha256sums_x86_64=('f821a8e1b920512d6f31038302ec5aa8b5eee4d662e2088fe9b60f2665767229')
sha256sums_aarch64=('4c94b5a9f1819d0dd2f22ee793c9d2c79707b014f4107616971fbce0ea808731')

build() {
	cd "${srcdir}"

	mv "lefthook_${pkgver}_Linux_${CARCH}" lefthook
	chmod +x lefthook

	./lefthook completion zsh >lefthook.zsh
	./lefthook completion fish >lefthook.fish
	./lefthook completion bash >lefthook.bash
}

package() {
	cd "${srcdir}"

	# Install lefthook
	install -D -m0755 lefthook \
		"${pkgdir}/usr/bin/lefthook"

	# Install completions
	install -Dm644 lefthook.zsh "${pkgdir}/usr/share/zsh/site-functions/_lefthook"
	install -Dm644 lefthook.fish "${pkgdir}/usr/share/fish/completions/lefthook.fish"
	install -Dm644 lefthook.bash "${pkgdir}/usr/share/bash-completion/completions/lefthook"
}
