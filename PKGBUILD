pkgname=lefthook-bin
pkgver=1.8.5
pkgrel=1
pkgdesc="git hooks manager"
arch=('x86_64' 'aarch64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
depends=()
makedepends=()
provides=('lefthook')
conflicts=('lefthook')
source_x86_64=("https://github.com/evilmartians/lefthook/releases/download/v${pkgver}/lefthook_${pkgver}_Linux_x86_64.gz")
source_aarch64=("https://github.com/evilmartians/lefthook/releases/download/v${pkgver}/lefthook_${pkgver}_Linux_arm64.gz")
sha256sums_x86_64=('aaeb312be84b08ed19f36693adcb9070efca2c4222790025fa992b998dfc3f87')
sha256sums_aarch64=('b91db91e0880b42a9d17f403cdf78a486d56f20e5260d02f31889af98fc89aae')

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
