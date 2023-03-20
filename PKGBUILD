# Maintainer: Flávio Tapajós <tapajos@outlook.com>

_pkgname='ory-cli'
pkgname="${_pkgname}-bin"
pkgver=0.2.2
pkgrel=3
pkgdesc="ORY Command Line Interface (CLI)"
arch=('x86_64')
url="https://ory.sh"
license=('Apache')
depends=()
provides=("${_pkgname}")
source=("https://github.com/ory/cli/releases/download/v${pkgver//_/-}/ory_${pkgver//_/-}-linux_64bit.tar.gz")
sha256sums=('296bec4ed8aeb25cae24d5dfb0ad6d742f924e87d45981c3c45582b22884a449')

build() {
	# create completion scripts
	mkdir -p ${srcdir}/fish/vendor_completions.d/
	"${srcdir}/ory" completion fish > ${srcdir}/fish/vendor_completions.d/ory.fish

	mkdir -p ${srcdir}/bash-completion/completions/
	"${srcdir}/ory" completion bash > ${srcdir}/bash-completion/completions/ory

	mkdir -p ${srcdir}/zsh/site-functions/
	"${srcdir}/ory" completion zsh > ${srcdir}/zsh/site-functions/_ory
}

package() {
	install -m644 -D "${srcdir}/fish/vendor_completions.d/ory.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/ory.fish"
	install -m644 -D "${srcdir}/bash-completion/completions/ory" "${pkgdir}/usr/share/bash-completion/completions/ory"
	install -m644 -D "${srcdir}/zsh/site-functions/_ory" "${pkgdir}/usr/share/zsh/site-functions/_ory"

	install -m755 -D "${srcdir}/ory" "${pkgdir}/usr/bin/ory"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
