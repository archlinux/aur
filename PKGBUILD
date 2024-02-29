pkgname=lefthook-bin
pkgver=1.6.4
pkgrel=2
pkgdesc="git hooks manager"
arch=('x86_64' 'aarch64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
depends=()
makedepends=()
provides=('lefthook')
conflicts=('lefthook')
source_x86_64=("https://github.com/evilmartians/lefthook/releases/download/v${pkgver}/lefthook_${pkgver}_Linux_x86_64.gz")
source_aarch64=("https://github.com/evilmartians/lefthook/releases/download/v${pkgver}/lefthook_${pkgver}_Linux_aarch64.gz")
sha256sums_x86_64=('e0eaeee4757fa6b895f5638a12d36dc1b88757bb927bf42226eceb7e7e3a1c76')
sha256sums_aarch64=('7a5afe6e61ec4c7e1a48606381cc5ce0bb1a8e9ae716a58d4bc340021abf05a1')

package() {
	cd "${srcdir}"

	mv "lefthook_${pkgver}_Linux_${CARCH}" lefthook
	chmod +x lefthook

	# Install lefthook
	install -D -m0755 lefthook \
		"${pkgdir}/usr/bin/lefthook"

	# Install completions
	mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
	./lefthook completion zsh >"${pkgdir}/usr/share/zsh/site-functions/_lefthook"

	mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d"
	./lefthook completion fish >"${pkgdir}/usr/share/fish/vendor_completions.d/lefthook.fish"

	mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
	./lefthook completion bash >"${pkgdir}/usr/share/bash-completion/completions/lefthook"
}
