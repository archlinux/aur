# Maintainer: Lefthook <lefthook@evilmartians.com>

pkgname=lefthook-bin
pkgdesc="Git hooks manager"
pkgver=1.11.12
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
sha256sums_x86_64=('acd8bc98fcb2b76e213ba0003475abc4b693e668d5f30077d8c1f842d1de765d')
sha256sums_aarch64=('0abcaa771822ecfad0da863ede4f940f9b4ca953dd2cd475642a93d8ce77f23f')

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
