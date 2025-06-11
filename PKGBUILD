# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname="sqruff"
_repo="quarylabs/sqruff"
pkgname="${_pkgname}-bin"
pkgver=0.26.6
pkgrel=1
pkgdesc="Fast SQL formatter/linter"
arch=('x86_64' 'aarch64')
url="https://github.com/$_repo"
license=('Apache-2.0')
makedepends=('curl' 'grep' 'sed' 'unzip')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('954c30259208c39cf74febfd8e7466e1a9bf6479c6aa7a7e85f1e39afce7bda7')
sha256sums_x86_64=('06551739998724a2f4e9b7a908caa254b6eb81c466b030f9d3eafb3a440e1d5f')
sha256sums_aarch64=('e8a3232b56a081dc7175cd885578580b248a1c5a358b575a58fc89fd5aeba198')
source=("LICENSE-${sha256sums}::https://raw.githubusercontent.com/${_repo}/v${pkgver}/LICENSE")
source_x86_64=("sqruff-linux-x86_64-${sha256sums_x86_64}.tar.gz::${url}/releases/download/v$pkgver/sqruff-linux-x86_64-musl.tar.gz")
source_aarch64=("sqruff-linux-aarch64-${sha256sums_aarch64}.tar.gz::${url}/releases/download/v$pkgver/sqruff-linux-aarch64-musl.tar.gz")
pkgver() {
	curl --silent -L "https://api.github.com/repos/${_repo}/releases/latest" | # Get latest release from GitHub api
		grep '"tag_name":' |                                                      # Get tag line
		sed -E 's/.*"([^"]+)".*/\1/' |
		sed 's/v//'
}

package() {
	install -Dm 644 "${srcdir}/LICENSE-${sha256sums}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 755 "${srcdir}/sqruff" "${pkgdir}/usr/bin/sqruff"
}
