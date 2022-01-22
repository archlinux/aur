# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")
pkgname=park
pkgver=0.1.2
pkgrel=1
pkgdesc="Configuration-based dotfiles manager"
url="https://gitlab.com/gbrlsnchs/park"
source=("https://gitlab.com/gbrlsnchs/park/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
arch=("x86_64" "i686")
license=("MIT")

makedepends=("cargo")
optdepends=(
	"gettext: contains envsubst, which can be used in configs to resolve environment variables"
)

sha256sums=("5ea22dccb489c84123c2a45fb1c9617da785f1541e01a334e12b51a343381de3")

build () {
	cd "${srcdir}/${pkgname}-v${pkgver}"

	cargo build --release
}

package() {
	cd "${srcdir}/${pkgname}-v${pkgver}"
	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "target/completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}.bash"
	install -Dm644 "target/completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
	install -Dm644 "target/completions/_${pkgname}" "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_${pkgname}"
}
