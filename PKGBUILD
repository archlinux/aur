# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname="claurst"
_repo="Kuberwastaken/claurst"
pkgname="${_pkgname}-bin"
pkgver=0.1.8
pkgrel=1
pkgdesc="Your Favorite Terminal Coding Agent, now in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/$_repo"
license=('GPL-3.0-only')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('81cbae84a29ce7e770bf2bc7b178e50bda0ce8de6067aba661b0bc7b05b562f8')
sha256sums_x86_64=('8f2f8663d099133612193af77382492904800b3c7ea0b2936cc7a16c63186a11')
sha256sums_aarch64=('354af0c07a413596634568981a63229041148452f5d3841038c347b3059ab399')
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
