# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname="sqruff"
_repo="quarylabs/sqruff"
pkgname="${_pkgname}-bin"
pkgver=0.34.0
pkgrel=1
pkgdesc="Fast SQL formatter/linter"
arch=('x86_64' 'aarch64')
url="https://github.com/$_repo"
license=('Apache-2.0')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('954c30259208c39cf74febfd8e7466e1a9bf6479c6aa7a7e85f1e39afce7bda7')
sha256sums_x86_64=('285656d0ac173706ae198cec5bb619754184f43619a880fb229890165ca8fd1c')
sha256sums_aarch64=('04f3b01db62ec72bbd98f8fb8b65cb8bf2e3f8429aa5c9563754211eedec0802')
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
