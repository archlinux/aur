# Maintainer: Lefthook <lefthook@evilmartians.com>

pkgname=lefthook-bin
pkgdesc="Git hooks manager"
pkgver=2.0.16
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
sha256sums_x86_64=('a0916703db56e2457142e9e636812d511db6512ee98156a2bb1e033e09c65969')
sha256sums_aarch64=('23b2bafb04345f3c59f12e47c770edd50395dd781f4d20b9330d667673b33db7')

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
