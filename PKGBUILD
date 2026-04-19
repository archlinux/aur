# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname="claurst"
_repo="Kuberwastaken/claurst"
pkgname="${_pkgname}-bin"
pkgver=0.0.9
pkgrel=1
pkgdesc="Your Favorite Terminal Coding Agent, now in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/$_repo"
license=('GPL-3.0-only')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('81cbae84a29ce7e770bf2bc7b178e50bda0ce8de6067aba661b0bc7b05b562f8')
sha256sums_x86_64=('698644bdfdb4e7432d0563d41da29f9934874be009210ea767b3796a1c3a995c')
sha256sums_aarch64=('9a939a715c54786daf88da4f8c8dbff141862dcbbdcae38e35f525e58dd08304')
source=(
	"LICENSE-${sha256sums[1]}::https://raw.githubusercontent.com/$_repo/v${pkgver}/LICENSE.md"
)
source_x86_64=("${_pkgname}-linux-x86_64-${sha256sums_x86_64}.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-linux-x86_64.tar.gz")
source_aarch64=("${_pkgname}-linux-aarch64-${sha256sums_aarch64}.tar.gz::$url/releases/download/v$pkgver/${_pkgname}-linux-aarch64.tar.gz")

pkgver() {
	curl --silent -L "https://api.github.com/repos/$_repo/releases/latest" | # Get latest release from GitHub api
		grep '"tag_name":' |                                                    # Get tag line
		sed -E 's/.*"([^"]+)".*/\1/' |
		sed 's/v//'
}

package() {
	install -Dm 644 "${srcdir}/LICENSE-${sha256sums[1]}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	if [[ "$CARCH" = 'x86_64' ]]; then
		install -Dm 755 "${srcdir}/${_pkgname}-linux-x86_64" "${pkgdir}/usr/bin/${_pkgname}"
	elif [[ "$CARCH" = 'aarch64' ]]; then
		install -Dm 755 "${srcdir}/${_pkgname}-linux-aarch64" "${pkgdir}/usr/bin/${_pkgname}"
	fi
}
