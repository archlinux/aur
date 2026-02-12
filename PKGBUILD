# Maintainer: Lefthook <lefthook@evilmartians.com>

pkgname=lefthook-bin
pkgdesc="Git hooks manager"
pkgver=2.1.1
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
sha256sums_x86_64=('5d29942bb5954c59d67d8c37184411034e576ed2829e22b0a6d88bba934e4fbb')
sha256sums_aarch64=('46907f78fa64de6d47e4f4c6b80f9ad246a09c67262c00ba5a32c74217d7f5ea')

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
