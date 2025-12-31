# Maintainer: Kamack38 <kamack38.biznes@gmail.com>
_pkgname="sqruff"
_repo="quarylabs/sqruff"
pkgname="${_pkgname}-bin"
pkgver=0.32.0
pkgrel=1
pkgdesc="Fast SQL formatter/linter"
arch=('x86_64' 'aarch64')
url="https://github.com/$_repo"
license=('Apache-2.0')
makedepends=('curl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('954c30259208c39cf74febfd8e7466e1a9bf6479c6aa7a7e85f1e39afce7bda7')
sha256sums_x86_64=('fa896f27071e58a0d9c01aca92e3fdb91ff422d7f644624cd776e223a47ba215')
sha256sums_aarch64=('888e069430ac7547bdc3065520ab877334ca6e2489eddcaac1328ae81c52791c')
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
