# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname="claurst"
_repo="Kuberwastaken/claurst"
pkgname="${_pkgname}-bin"
pkgver=0.1.5
pkgrel=1
pkgdesc="Your Favorite Terminal Coding Agent, now in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/$_repo"
license=('GPL-3.0-only')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('81cbae84a29ce7e770bf2bc7b178e50bda0ce8de6067aba661b0bc7b05b562f8')
sha256sums_x86_64=('1d224478ec3fa100dbabf14e8e3ad36770204a8e021f6ba2b242546a9b05e643')
sha256sums_aarch64=('45b04ee3f1659b67eac6976b2455e9feb8bec4bdad346939734c4e88d6bd9077')
source=(
	"LICENSE-${sha256sums[0]}::https://raw.githubusercontent.com/$_repo/v${pkgver}/LICENSE.md"
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
	install -Dm 644 "${srcdir}/LICENSE-${sha256sums[0]}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
