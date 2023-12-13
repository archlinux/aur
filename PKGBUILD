# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: Dominik Braun <mail at dominikbraun dot io>
pkgname=timetrace-bin
pkgver=0.14.3
pkgrel=5
pkgdesc="Simple CLI for tracking your working time."
arch=("x86_64")
url="https://github.com/dominikbraun/timetrace"
license=("Apache")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=()
optdepends=(
	'bash-completion'
)
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64.tar.gz")
sha256sums=('a9d5fb7983578106ab32138ea6a5815755120cc68374140bffddab934f6a3631')
build() {
	"${srcdir}/${pkgname%-bin}" completion bash > "${srcdir}/${pkgname%-bin}.bash"
	"${srcdir}/${pkgname%-bin}" completion zsh > "${srcdir}/_${pkgname%-bin}"
	"${srcdir}/${pkgname%-bin}" completion fish > "${srcdir}/${pkgname%-bin}.fish"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin/"
	install -Dm644 "${srcdir}/${pkgname%-bin}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-bin}"
	install -Dm644 "${srcdir}/_${pkgname%-bin}" -t "${pkgdir}/usr/share/zsh/site-functions"
	install -Dm644 "${srcdir}/${pkgname%-bin}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
}